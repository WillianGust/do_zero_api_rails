class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :nome
      t.string :modelo
      t.string :marca
      t.integer :ano

      t.timestamps
    end
  end
end
