class AddPecaIdToEstoques < ActiveRecord::Migration[7.2]
  def change
    add_reference :estoques, :peca, null: false, foreign_key: true
  end
end
