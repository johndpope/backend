DeviseTokenAuth.setup do |config|
  config.omniauth_prefix = "/omniauth"
  config.token_lifespan = 1.year
end
