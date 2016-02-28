class CreateCategoryContents < ActiveRecord::Migration
  def change
    create_table :category_contents do |t|
      t.integer :category_id
      t.integer :content_id

      t.timestamps null: false
    end
  end
end
