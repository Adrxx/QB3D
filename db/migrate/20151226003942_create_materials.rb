class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.string :price
      t.boolean :available

      t.timestamps null: false
    end
  end
end
