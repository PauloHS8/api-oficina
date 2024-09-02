class CreateAtendimentos < ActiveRecord::Migration[7.2]
  def change
    create_table :atendimentos do |t|
      t.datetime :data_inicio
      t.datetime :data_termino
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
