json.extract! estoque, :id, :codigo, :quantidade, :created_at, :updated_at
json.url estoque_url(estoque, format: :json)
