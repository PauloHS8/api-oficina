class ModifyServicosForAtendimentos < ActiveRecord::Migration[7.2]
  def change
    remove_reference :servicos, :veiculo, foreign_key: true
    remove_reference :servicos, :cliente, foreign_key: true

    create_join_table :atendimentos, :servicos do |t|
      t.index [:atendimento_id, :servico_id]
      t.index [:servico_id, :atendimento_id]
    end
  end
end
