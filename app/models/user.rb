class User < ApplicationRecord
  # Rolify
  rolify

  # Devise
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :omniauthable

  # Concerns
  include DeviseTokenAuth::Concerns::User

  # https://github.com/lynndylanhurley/devise_token_auth/issues/121
  def destroy_expired_tokens
    if self.tokens
      jsonTokens = JSON.parse(self.tokens)
      jsonTokens.delete_if do |cid, v|
        expiry = v[:expiry] || v["expiry"]
        DateTime.strptime(expiry.to_s, '%s') < Time.now
      end
      self.tokens = jsonTokens.to_json
    end
  end
end
