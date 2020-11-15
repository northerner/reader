class CreateFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :feeds do |t|
      t.string :url
      t.string :title
      t.timestamp :last_checked
      t.timestamp :last_published_entry

      t.timestamps
    end
  end
end
