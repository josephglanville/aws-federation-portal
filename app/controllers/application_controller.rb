class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  prepend_before_filter :authenticate!
end
