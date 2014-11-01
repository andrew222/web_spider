class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.integer :author_id
      t.datetime :failed_at
      t.datetime :last_reply_at
      t.integer :post_count
      t.integer :view_count

      t.timestamps
    end
  end
end
