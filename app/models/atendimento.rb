class Atendimento < ApplicationRecord
  belongs_to :veiculo
  has_and_belongs_to_many :funcionarios

  enum status: { agendado: 'agendado', andamento: 'andamento', concluido: 'concluído', cancelado: 'cancelado' }

  validates :data_inicio, :data_termino, :status, presence: true
end
