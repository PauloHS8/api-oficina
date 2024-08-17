json.extract! servico, :id, :codigo, :nome, :descricao, :preco, :created_at, :updated_at
json.url servico_url(servico, format: :json)
