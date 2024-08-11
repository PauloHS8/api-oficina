class Peca < ApplicationRecord
  has_and_belongs_to_many :estoques
end
