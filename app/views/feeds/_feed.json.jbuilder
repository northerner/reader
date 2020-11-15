json.extract! feed, :id, :url, :title, :last_checked, :last_published_entry, :created_at, :updated_at
json.url feed_url(feed, format: :json)
