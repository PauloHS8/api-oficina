class CreateJoinTableServicoFuncionario < ActiveRecord::Migration[7.2]
  def change
    create_join_table :servicos, :funcionarios do |t|
      # t.index [:servico_id, :funcionario_id]
      # t.index [:funcionario_id, :servico_id]
    end
  end
end
