class CreateJoinTableAtendimentoFuncionario < ActiveRecord::Migration[7.2]
  def change
      create_join_table :atendimentos, :funcionarios do |t|
        t.index :atendimento_id
        t.index :funcionario_id
      end
  end
end