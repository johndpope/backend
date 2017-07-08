Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount_devise_token_auth_for 'User',
    at: 'auth',
    skip: ["registrations", "sessions"],
    controllers: { omniauth_callbacks: "overrides/omniauth_callbacks" }
end
