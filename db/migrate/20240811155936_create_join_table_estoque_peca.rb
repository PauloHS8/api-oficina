class CreateJoinTableEstoquePeca < ActiveRecord::Migration[7.2]
  def change
    create_join_table :estoques, :pecas do |t|
      # t.index [:estoque_id, :peca_id]
      # t.index [:peca_id, :estoque_id]
    end
  end
end
