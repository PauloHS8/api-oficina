class User < ApplicationRecord
  enum role: { cliente: 0, admin: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
