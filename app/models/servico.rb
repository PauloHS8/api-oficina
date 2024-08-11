class Servico < ApplicationRecord
  has_and_belongs_to_many :atendimentos

  validates :codigo, :nome, :descricao, :preco, presence: true
end
