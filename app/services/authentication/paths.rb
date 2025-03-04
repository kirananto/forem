# rubocop:disable Style/OptionHash
module Authentication
  # These are meant to be called from the specific providers
  module Paths
    # Returns the authentication path for the given provider
    def self.authentication_path(provider_name, params = {})
      Rails.application.routes.url_helpers.public_send(
        "user_#{provider_name}_omniauth_authorize_path", params
      )
    end

    # Returns the sign in URL for the given provider
    def self.sign_in_path(provider_name, params = {})
      url_helpers = Rails.application.routes.url_helpers

      callback_url_helper = "user_#{provider_name}_omniauth_callback_path"
      mandatory_params = {
        callback_url: URL.url(url_helpers.public_send(callback_url_helper))
      }

      authentication_path(provider_name, params.merge(mandatory_params))
    end
  end
end
# rubocop:enable Style/OptionHash
