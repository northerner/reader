class Feed::Create < ApplicationMediator
  def initialize(url:, tags:)
    @url = url
    @tags = tags
  end

  def call
    xml = Net::HTTP.get(URI(@url))
    
    parsed_feed = Feedjira.parse(xml)

    Feed.create(
      url: @url,
      title: parsed_feed.title,
      tags: @tags
    )
  end
end
