json.extract! funcionario, :id, :matricula, :nome, :cargo, :email, :salario, :data_admissao, :cpf, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
