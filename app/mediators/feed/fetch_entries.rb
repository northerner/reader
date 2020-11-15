class Feed::FetchEntries < ApplicationMediator
  def initialize(feed:)
    @feed = feed
  end

  def call
    xml = Net::HTTP.get(URI(@feed.url))
    @feed.update!(last_checked: Time.current)
    parsed_feed = Feedjira.parse(xml)

    return if up_to_date?(parsed_feed)

    parsed_feed.entries.each do |entry|
      next if Entry.find_by(remote_id: entry.entry_id)

      @feed.entries.create(
        url: entry.url,
        title: entry.title,
        remote_id: entry.entry_id,
        content: entry.content,
        published_at: entry.published
      )
    end

    @feed.update!(last_published_entry: parsed_feed.entries.first.published)
  end

  private

  def up_to_date?(parsed_feed)
    parsed_feed.entries.first.published == @feed.last_published_entry
  end
end
