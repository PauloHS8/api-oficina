class Veiculo < ApplicationRecord
  belongs_to :cliente

  validates :placa, uniqueness: true, presence: true, length: { minimum: 7, maximum: 7}
  validates :modelo, presence: true, length: { minimum: 10, maximum: 10 }
  validates :ano, presence: true
  validates :cor, presence: true, length: { minimum: 15, maximum: 15 }
  validates :quilometragem, presence: true
  validates :chassi, presence: true, length: { minimum: 17, maximum: 17 }

end
