class ManagerController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "/managers/#{session[:user_id]}"
    else
    erb :'/managers/create_manager'
    end
  end

  post '/signup' do
    if Manager.all.detect {|manager| manager.name == params[:manager][:name]}
      redirect '/signup'
    else
    @manager= Manager.create(params[:manager])
    session[:user_id]= @manager.id
    erb :'/managers/show'
  end
  end

  get '/managers/:id' do
    if !logged_in?
      redirect '/'
    else
      @manager= Manager.find_by_id(params[:id])
      erb :'/managers/show'
    end

  end



end
