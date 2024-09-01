class CreateVendaServicos < ActiveRecord::Migration[7.2]
  def change
    create_table :venda_servicos do |t|
      t.references :servico, null: false, foreign_key: true
      t.references :cliente, null: false, foreign_key: true
      t.references :veiculo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
