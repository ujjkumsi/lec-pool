class LoginsController < ApplicationController
  skip_before_filter :check_token
  def create
    Basecamp.establish_connection!('myhost.basecamphq.com', params[:user], params[:password], true)
    session[:token] = Basecamp.get_token
    redirect_to session[:original_url]
  end
end
