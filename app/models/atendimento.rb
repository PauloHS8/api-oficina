class Atendimento < ApplicationRecord
  belongs_to :veiculo
  has_and_belongs_to_many :funcionarios

  enum :status, { agendado: 0, andamento: 1, concluido: 2, cancelado: 3 }

  validates :data_inicio, :data_termino, :status, presence: true
end
