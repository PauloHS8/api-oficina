class VendaServico < ApplicationRecord
  belongs_to :servico
  belongs_to :cliente
  belongs_to :veiculo
end
