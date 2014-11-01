class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :url
      t.string :title
      t.datetime :failed_at

      t.timestamps
    end
  end
end
