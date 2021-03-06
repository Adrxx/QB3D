class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :hex
      t.boolean :available
      t.belongs_to :material, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
