class Administrador < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :senha, presence: true, length: { minimum: 6 }
end
