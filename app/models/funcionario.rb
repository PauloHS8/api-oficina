class Funcionario < ApplicationRecord
  has_and_belongs_to_many :atendimentos

  validates :matricula, presence: true
  validates :nome, presence: true, length: { minimum: 3 }
  validates :cargo, presence: true, length: { minimum: 5 }
  validates :email, presence: true
  validates :salario, presence: true
  validates :data_admissao, presence: true
  validates :cpf, presence: true, length: { minimum: 11, maximum: 11 }
end
