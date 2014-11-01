class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :title
      t.string :url
      t.string :site_type
      t.boolean :finished, default: false
      t.text :message

      t.timestamps
    end
  end
end
