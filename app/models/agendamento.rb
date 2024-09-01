class Agendamento < ApplicationRecord
  belongs_to :veiculo
  belongs_to :servico

  enum status: { pendente: 0, confirmado: 1, reprovado: 2 }
end
