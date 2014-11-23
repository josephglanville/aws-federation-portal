require 'adauth'
require 'sts'

class User < Adauth::AdObjects::User
  def token(account_name, policy)
    account = Settings.aws_accounts[account_name]
    creds = {
      access_key_id: account.access_key_id,
      secret_access_key: account.secret_access_key
    }
    STS::Token.new(login, creds, policy)
  end
end
