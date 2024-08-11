class Estoque < ApplicationRecord
  has_and_belongs_to_many :pecas

  validates :codigo, :quantidade, presence: true
end
