class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :brand
      t.float :price
      t.references :user

      t.timestamps
    end
  end
end
