class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :image
      t.boolean :cod_eligible

      t.timestamps
    end
  end
end
