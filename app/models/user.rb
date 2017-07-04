class User < ApplicationRecord
  # Concerns
  include DeviseTokenAuth::Concerns::User

  # Devise
  devise :database_authenticatable, :registerable, :rememberable, :trackable
end
