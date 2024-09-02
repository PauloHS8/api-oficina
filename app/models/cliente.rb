class Cliente < ApplicationRecord
  has_one :user, dependent: :destroy
  has_many :veiculos, dependent: :destroy

  validates :nome, presence: true, length: { in: 3..80 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :telefone, presence: true, length: { minimum: 11, maximum: 11 }
  validates :cpf, presence: true, uniqueness: true, length: { minimum: 11, maximum: 11 }
  validates :endereco, presence: true, length: { in: 3..80 }
end
