class Cliente < ApplicationRecord
  has_many :veiculos

  validates :nome, presence: true, length: { in: 2..100 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :telefone, :cpf, presence: true, length: { minimum: 11, maximum: 11 }
  validates :endereco, presence: true, length: { minimum: 5, maximum: 50 }
end
