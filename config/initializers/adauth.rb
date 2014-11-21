Adauth.configure do |config|
  s = Settings.active_directory
  config.domain = s.domain
  config.server = s.server
  config.base = s.base
  config.query_user = s.query_user
  config.query_password = s.query_password
end
