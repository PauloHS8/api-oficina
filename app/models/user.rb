class User < ApplicationRecord
  belongs_to :cliente, optional: true
  enum :role, { cliente: 0, admin: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
