class Estoque < ApplicationRecord
  belongs_to :peca

  validates :codigo, :quantidade, presence: true
end
