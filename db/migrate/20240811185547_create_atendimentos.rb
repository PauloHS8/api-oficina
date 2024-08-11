class CreateAtendimentos < ActiveRecord::Migration[7.2]
  def change
    create_table :atendimentos do |t|
      t.datetime :data_inicio
      t.datetime :data_termino
      t.string :status
      t.references :veiculo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
