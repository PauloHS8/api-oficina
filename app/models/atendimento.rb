class Atendimento < ApplicationRecord
  belongs_to :veiculo
  has_and_belongs_to_many :funcionarios

  enum :status, [ :agendado, :andamento, :concluido, :cancelado ]

  validates :data_inicio, :data_termino, :status, presence: true
end
