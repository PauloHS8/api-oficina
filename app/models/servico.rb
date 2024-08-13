class Servico < ApplicationRecord
  has_and_belongs_to_many :atendimentos

  validates :codigo, :nome,  presence: true
  validates :descricao, presence: true, length: { maximum: 100 }
  validates :preco, presence: true
end
