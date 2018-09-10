class ManagerController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "/managers/#{session[:user_id]}"
    else
    erb :'/managers/create_manager'
    end
  end

  post '/signup' do
    @manager= Manager.new(params[:manager])
    @manager.name = @manager.name.downcase
    if Manager.all.detect {|manager| manager.name == @manager.name} || params[:manager][:password]=="" || params[:manager][:name] == "" || params[:manager][:email] == ""
      redirect '/signup'
    else
    @manager.save
    session[:user_id]= @manager.id
    erb :'/managers/show'
  end
  end

  get '/managers/:id' do

    not_logged_in
      @manager= Manager.find_by_id(params[:id])

      erb :'/managers/show'
  end

  get '/login' do
    erb :'managers/login'
  end


  post '/login' do
    @manager = Manager.find_by(name: params[:name])
    if @manager && @manager.authenticate(params[:password])
      session[:user_id] = @manager.id
      redirect "/managers/#{session[:user_id]}"
    else
      redirect '/login'
    end
  end


  get '/signout' do
    session.clear
    redirect '/'
  end


end
