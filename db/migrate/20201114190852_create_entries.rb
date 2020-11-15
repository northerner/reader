class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :url
      t.string :title
      t.string :remote_id, null: false
      t.text :content
      t.boolean :read, default: false
      t.timestamp :published_at

      t.references :feed

      t.timestamps
    end
  end
end
