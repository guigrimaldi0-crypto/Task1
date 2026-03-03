class User < ApplicationRecord
  has_many :veiculos

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
