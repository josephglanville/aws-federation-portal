require 'active_model'

class AwsAccount
  include ActiveModel::Model
  attr_accessor :name, :access_key_id, :secret_access_key
end
