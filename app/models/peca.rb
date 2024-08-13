class Peca < ApplicationRecord
  has_and_belongs_to_many :estoques

  validates :codigo, presence: true, uniqueness: true
  validates :nome, presence: true, length: { in: 2..20 }
  validates :preco, :tipo, :fabricante, :data_validade, presence: true
end
