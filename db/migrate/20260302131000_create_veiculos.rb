class CreateVeiculos < ActiveRecord::Migration[7.0]
  def change
    create_table :veiculos do |t|
      t.string :marca
      t.string :modelo
      t.integer :ano
      t.string :placa
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
