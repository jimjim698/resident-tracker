require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "managersecret"
  end

  get '/' do
    if logged_in?
      redirect "/managers/#{session[:user_id]}"
    else
    erb :index
  end
  end


  helpers do

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= Manager.find_by_id(session[:user_id])
  end

  def not_logged_in
    if !logged_in?
    redirect '/login?error=Please log in to continue'
  end
  end

end

end
