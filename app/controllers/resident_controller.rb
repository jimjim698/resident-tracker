class ResidentController < ApplicationController

  get '/residents/new' do
    erb :'/residents/add_resident'
  end

  post '/residents/new' do
    @resident = Resident.create(params[:resident])
    @resident.manager_id = session[:user_id]
    redirect "/managers/#{session[:user_id]}"
  end 

end
