require "figaro"
require "omniauth"

Rails.application.config.middleware.use OmniAuth::Builder do
  github_scopes = "email, profile"
  provider :github, Figaro.env.github_key, Figaro.env.github_secret, scope: github_scopes
end
