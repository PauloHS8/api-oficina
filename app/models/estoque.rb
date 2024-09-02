class Estoque < ApplicationRecord
  belongs_to :peca

  validates :codigo, presence: true, uniqueness: true
  validates :quantidade, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
