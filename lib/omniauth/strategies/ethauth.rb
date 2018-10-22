require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Ethauth < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://demo.pelith.com/',
        :authorize_url => '/auth/'
      }

      def request_phase
        super
      end

      uid { raw_info['id'].to_s }

      info do
        {
          name: raw_info['name'],
          username: raw_info['username'],
          email: raw_info['email'],
          image: raw_info['avatar_url']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('user').parsed
      end

      private

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

OmniAuth.config.add_camelization 'ethauth', 'Ethauth'