class AddVeiculoToAtendimento < ActiveRecord::Migration[7.2]
  def change
    add_reference :atendimentos, :veiculo, null: false, foreign_key: true
  end
end
