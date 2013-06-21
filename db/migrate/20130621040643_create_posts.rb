class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts, force: true do |t|
      t.string :title
      t.string :link
      t.text :categories
      t.string :guid
      t.text :description
      t.text :html

      t.timestamps

      t.index :created_at
      t.index :guid
      t.index :link
    end
  end
end
