json.extract! servico, :id, :codigo, :nome, :descricao, :preco, :veiculo_id, :cliente_id, :created_at, :updated_at
json.url servico_url(servico, format: :json)
