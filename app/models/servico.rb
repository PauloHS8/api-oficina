class Servico < ApplicationRecord
  has_many :atendimentos

  validates :codigo, :nome, presence: true
  validates :descricao, presence: true, length: { maximum: 100 }
  validates :preco, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
