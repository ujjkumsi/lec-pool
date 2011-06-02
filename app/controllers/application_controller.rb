class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  before_filter :check_token
  protected
  def check_token
    unless session[:token]
      session[:original_url] = request.url
      redirect_to :controller => :logins, :action => :new
    end
  end
end
