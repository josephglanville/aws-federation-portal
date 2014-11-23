require 'account_storage'

class AwsAccountsController < ApplicationController
  def index
    @aws_accounts = AWSAccountStorage.all
  end

  def login
    # TODO(jpg) load policies from storage
    policy = {
      actions: '*',
      resources: :any
    }
    token = current_user.token(params[:account], policy)
    redirect_to token.signin_url
  end
end
