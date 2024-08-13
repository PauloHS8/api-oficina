class CreateFuncionarios < ActiveRecord::Migration[7.2]
  def change
    create_table :funcionarios do |t|
      t.string :matricula
      t.string :nome
      t.string :cargo
      t.string :email
      t.decimal :salario
      t.date :data_admissao
      t.string :cpf

      t.timestamps
    end
  end
end
