class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :price
      t.boolean :sold
      t.string :category

      t.timestamps null: false
    end
  end
end
