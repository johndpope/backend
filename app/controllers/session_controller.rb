require "devise_token_auth"

class SessionsController < DeviseTokenAuth::SessionsController
  def render_create_success
    render json: @resource.tokens
  end
end