require 'adauth'
require 'warden/strategies/base'

module Warden
  module Strategies
    class AdAuthenticatable < Warden::Strategies::Base
      def authenticate!
        begin
          user = Adauth.authenticate username, password
          if user
            success!(user)
          else
            fail(:invalid_login)
          end
        rescue Net::LDAP::LdapError
          fail(:invalid_login)
        end
      end

      def username
        params['username']
      end

      def password
        params['password']
      end

    end
  end
end

Warden::Strategies.add(:active_directory, Warden::Strategies::AdAuthenticatable)
