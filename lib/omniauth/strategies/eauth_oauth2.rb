# frozen_string_literal: true

require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class EauthOauth2 < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://eauth.pelith.com/',
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/token'
      }

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
        end
      end

      uid { raw_info['id'].to_s }

      info do
        {
          nickname: raw_info['login'],
          name: raw_info['name'],
          username: raw_info['username'],
          email: raw_info['email']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/oauth/user').parsed
      end

      private

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

OmniAuth.config.add_camelization 'eauthoauth2', 'EauthOauth2'
