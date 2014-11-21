require 'account_storage'

class AwsAccountsController < ApplicationController
  def index
    @aws_accounts = AWSAccountStorage.all
  end

  def login
  end
end
