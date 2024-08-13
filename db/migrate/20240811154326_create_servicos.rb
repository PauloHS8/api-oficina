class CreateServicos < ActiveRecord::Migration[7.2]
  def change
    create_table :servicos do |t|
      t.string :codigo
      t.string :nome
      t.text :descricao
      t.decimal :preco
      t.references :veiculo, null: false, foreign_key: true
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
