class Estoque < ApplicationRecord
  has_and_belongs_to_many :pecas
end
