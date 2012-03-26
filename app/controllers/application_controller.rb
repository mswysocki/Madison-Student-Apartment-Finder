class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include Rack::Recaptcha::Helpers
  include SessionsHelper
end
