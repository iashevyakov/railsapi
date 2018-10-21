class CreateNewsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :news_items do |t|
      t.string :title
      t.text :description
      t.text :content
      t.string :author
      t.string :url
      t.string :url_to_image
      t.datetime :published_at

      t.timestamps
    end
  end
end
