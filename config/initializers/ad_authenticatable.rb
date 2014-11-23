require 'adauth'
require 'warden/strategies/base'

module Warden
  module Strategies
    class AdAuthenticatable < Warden::Strategies::Base
      def authenticate!
        user = Adauth.authenticate params['username'], params['password']
        if user
          success!(user)
        else
          fail(:invalid_login)
        end
      rescue Net::LDAP::LdapError
        # rubocop:disable Style/SignalException
        fail(:invalid_login)
      end
    end
  end
end

Warden::Strategies.add(:active_directory, Warden::Strategies::AdAuthenticatable)
