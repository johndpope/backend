Rails.application.routes.draw do
root :to => 'index#index'

  # Devise
  devise_for :users

  # API
  namespace :api do

    # API Devise
    mount_devise_token_auth_for 'User',
      at: 'auth',
      skip: ["registrations", "sessions"],
      controllers: { omniauth_callbacks: "overrides/omniauth_callbacks" }
  end

  # Admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

end
