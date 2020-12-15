class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :address
      t.float :price
      t.string :style

      t.timestamps
    end
  end
end
