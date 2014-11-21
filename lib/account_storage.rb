# If you wish to implement a custom storage backend it must
# implement the below interface
module AWSAccountStorage
  module SettingsBackend
    def self.find(name)
      AwsAccount.new(Settings.aws_accounts[name].to_h.merge({name: name.to_s}))
    end

    def self.all
      Settings.aws_accounts.map do |name, settings|
        AwsAccount.new(settings.to_h.merge({name: name.to_s}))
      end
    end
  end
 
  @backend = SettingsBackend

  def self.set_backend(name)
    @backend = self.const_get(name.to_s.capitalize + 'Backend')
  end

  def self.find(name)
    @backend.find(name)
  end

  def self.all
    @backend.all
  end

end
