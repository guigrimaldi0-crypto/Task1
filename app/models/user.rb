class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         authentication_keys: [:login]

  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)

    return nil if login.blank?

    where(conditions)
      .where(
        ["lower(username) = :value OR lower(email) = :value",
        { value: login.downcase }]
      )
      .first
  end

  def admin?
    role == "admin"
  end
end