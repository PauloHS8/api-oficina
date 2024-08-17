class Veiculo < ApplicationRecord
  belongs_to :cliente

  validates :placa, uniqueness: true, presence: true, length: { minimum: 7, maximum: 10 }
  validates :modelo, presence: true, length: { minimum: 3, maximum: 30 }
  validates :ano, presence: true
  validates :cor, presence: true, length: { minimum: 3, maximum: 15 }
  validates :quilometragem, presence: true
  validates :chassi, presence: true, length: { minimum: 10, maximum: 50 }

end
