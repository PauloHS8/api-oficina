class CreatePecas < ActiveRecord::Migration[7.2]
  def change
    create_table :pecas do |t|
      t.string :codigo
      t.string :nome
      t.decimal :preco
      t.string :tipo
      t.string :fabricante
      t.date :data_validade

      t.timestamps
    end
  end
end
