class Funcionario < ApplicationRecord
  has_and_belongs_to_many :atendimentos

  validates :matricula, presence: true, uniqueness: true
  validates :nome, presence: true, length: { in: 3..80 }
  validates :cpf, presence: true, uniqueness: true, length: { minimum: 11, maximum: 11 }
  validates :cargo, presence: true, length: { minimum: 5 }
  validates :email, presence: true
  validates :salario, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :data_admissao, presence: true
end
