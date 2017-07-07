Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', skip: ["registrations", "sessions"]

  # root to: "home#index"
end
