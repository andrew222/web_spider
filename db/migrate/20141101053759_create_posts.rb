class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.datetime :posted_at
      t.integer :author_id
      t.string :post_link
      t.integer :article_id

      t.timestamps
    end
  end
end
