Rails.application.routes.draw do
  # Devise
  devise_for :users, skip: ["registrations"]

  # API
  namespace :api do

    # API Devise
    mount_devise_token_auth_for 'User',
      at: 'auth',
      skip: ["registrations", "sessions"],
      controllers: { omniauth_callbacks: "overrides/omniauth_callbacks" }

    # API GraphQL
    post "/graphql", to: "graphql#execute"
  end

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  # Admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

end
