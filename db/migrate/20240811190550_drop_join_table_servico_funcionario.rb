class DropJoinTableServicoFuncionario < ActiveRecord::Migration[7.2]
  def change
    drop_join_table :servicos, :funcionarios
  end
end
