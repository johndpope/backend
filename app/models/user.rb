class User < ApplicationRecord
  # Rolify
  rolify

  # Devise
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :omniauthable

  # Concerns
  serialize :tokens, JSON #https://github.com/lynndylanhurley/devise_token_auth/issues/495
  include DeviseTokenAuth::Concerns::User
end
