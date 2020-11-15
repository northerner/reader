class AddTagsToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :tags, :string, array: true, default: []
    add_index  :feeds, :tags, using: 'gin'
  end
end
