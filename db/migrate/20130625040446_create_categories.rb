class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps

      t.index :name
    end

    create_table :categories_posts do |t|
      t.belongs_to :category, index: true
      t.belongs_to :post, index: true
    end

    remove_column :posts, :categories, :text
  end
end
