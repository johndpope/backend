class User < ApplicationRecord
  # Rolify
  rolify

  # Devise
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :omniauthable

  # Concerns
  include DeviseTokenAuth::Concerns::User

  # https://github.com/lynndylanhurley/devise_token_auth/issues/121
  def destroy_expired_tokens
    return if self.tokens == '{}'
    super
  end
end
