class HomeController < ApplicationController
  before_action :check_feeds

  def index
    scope = Entry.order(published_at: :desc)
    @entries = params[:tag].present? ? scope.where(feed_id: Feed.tagged(params[:tag]).pluck(:id)) : scope.all
    @tags = Feed.pluck(:tags).flatten.uniq
  end

  private

  def check_feeds
    Feed.all.each do |feed|
      next if (feed.last_checked && feed.last_checked > 2.hours.ago)

      Feed::FetchEntries.run(feed: feed)
    end
  end
end
