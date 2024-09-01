class CreateAgendamentos < ActiveRecord::Migration[7.2]
  def change
    create_table :agendamentos do |t|
      t.references :veiculo, null: false, foreign_key: true
      t.references :servico, null: false, foreign_key: true
      t.integer :status, default: 0, null: false
      t.date :data

      t.timestamps
    end
  end
end
