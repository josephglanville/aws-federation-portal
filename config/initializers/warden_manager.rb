require 'warden/manager'

Warden::Manager.serialize_into_session(&:login)

Warden::Manager.serialize_from_session do |id|
  User.where('sAMAccountName', id).first
end
