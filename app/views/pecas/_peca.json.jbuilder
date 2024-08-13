json.extract! peca, :id, :codigo, :nome, :preco, :tipo, :fabricante, :data_validade, :created_at, :updated_at
json.url peca_url(peca, format: :json)
