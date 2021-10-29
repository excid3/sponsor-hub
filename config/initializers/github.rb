require 'omniauth'
require 'omniauth-github'
require 'omniauth/builder'
require 'httplog' # require this *after* your HTTP gem of choice

OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  client_id = Rails.application.credentials.github.client_id
  client_secret = Rails.application.credentials.github.client_secret
  provider :github, client_id, client_secret
end
