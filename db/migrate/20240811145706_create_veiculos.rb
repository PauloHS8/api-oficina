class CreateVeiculos < ActiveRecord::Migration[7.2]
  def change
    create_table :veiculos do |t|
      t.string :placa
      t.string :modelo
      t.integer :ano
      t.string :cor
      t.integer :quilometragem
      t.string :chassi

      t.timestamps
    end
  end
end
