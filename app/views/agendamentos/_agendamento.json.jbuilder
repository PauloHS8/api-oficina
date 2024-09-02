json.extract! agendamento, :id, :veiculo_id, :servico_id, :status, :data, :created_at, :updated_at
json.url agendamento_url(agendamento, format: :json)
