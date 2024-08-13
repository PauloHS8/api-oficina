json.extract! veiculo, :id, :placa, :modelo, :ano, :cor, :quilometragem, :chassi, :created_at, :updated_at
json.url veiculo_url(veiculo, format: :json)
