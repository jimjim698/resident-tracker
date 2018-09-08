class ManagerController < ApplicationController

  get '/signup' do
    erb :'/managers/create_manager'
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



end
