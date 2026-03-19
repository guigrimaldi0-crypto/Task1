class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  after_initialize do
    self.role ||= "user"
  end

  def admin?
    role == "admin"
  end
end