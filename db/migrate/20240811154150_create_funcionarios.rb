class CreateFuncionarios < ActiveRecord::Migration[7.2]
  def change
    create_table :funcionarios do |t|
      t.string :matricula
      t.string :nome
      t.string :cpf
      t.string :cargo
      t.string :email
      t.decimal :salario
      t.date :data_admissao

      t.timestamps
    end
  end
end
