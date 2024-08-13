class Funcionario < ApplicationRecord
  has_and_belongs_to_many :atendimentos

  validates :matricula, presence: true
  validates :nome, presence: true, length: { minimum: 3 }
  validates :cargo, :email, presence: true, length: { minimum: 5 }
  validates :salario, presence: true
  validates :cpf, presence: true, length: { minimum: 11, maximum: 11}
end
