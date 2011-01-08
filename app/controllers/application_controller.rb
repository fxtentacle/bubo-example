# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def make_bubo
    # you could replace this with Bubo.from_heroku if you're deploying on heroku with our add-on
    Bubo.new('bubo-example@spratpix.com',ENV['api_key'])
  end
end
