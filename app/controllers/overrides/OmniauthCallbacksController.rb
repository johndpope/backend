module Overrides
  class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
    def omniauth_success
      get_resource_from_auth_hash
      create_token_info
      set_token_on_resource
      create_auth_params

      if resource_class.devise_modules.include?(:confirmable)
        # don't send confirmation email!!!
        @resource.skip_confirmation!
      end

      sign_in(:user, @resource, store: false, bypass: false)

      if auth_hash["credentials"] && auth_hash["credentials"]["token"]
        @resource.assign_attributes {"github_access_token": auth_hash["credentials"]["token"]}
      end

      @resource.save!

      yield @resource if block_given?
      render_data_or_redirect('deliverCredentials', @auth_params.as_json, @resource.as_json)
    end
  end
end
