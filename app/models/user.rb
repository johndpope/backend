class User < ApplicationRecord
  # Devise
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :omniauthable

  # Concerns
  include DeviseTokenAuth::Concerns::User

  def token_validation_response
    self.tokens
  end

end
