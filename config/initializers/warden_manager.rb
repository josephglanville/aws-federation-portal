require 'warden/manager'

Warden::Manager.serialize_into_session do |user|
  user.login
end

Warden::Manager.serialize_from_session do |id|
  User.where('sAMAccountName', id).first
end
