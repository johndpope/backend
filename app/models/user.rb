class User < ApplicationRecord
  # Devise
  devise :database_authenticatable, :registerable, :rememberable, :trackable
end
