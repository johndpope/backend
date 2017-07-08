Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount_devise_token_auth_for 'User',
    at: 'auth',
    skip: ["registrations", "sessions"],
    controllers: { omniauth_callbacks: "overrides/omniauth_callbacks" }
end
