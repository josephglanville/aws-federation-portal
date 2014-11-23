require 'account_storage'

class AwsAccountsController < ApplicationController
  def index
    @aws_accounts = AWSAccountStorage.all
  end

  def login
    token = current_user.token(params[:account], actions: '*', resources: :any)
    redirect_to token.signin_url
  end
end
