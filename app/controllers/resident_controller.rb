class ResidentController < ApplicationController

  get '/residents/new' do
    erb :'/residents/add_resident'
  end

  post '/residents/new' do
    if Resident.all.detect {|resident| resident.name == params[:resident][:name]}
      redirect '/residents/new'
    else
      @resident = Resident.create(params[:resident])
      @resident.manager_id = session[:user_id]
      @resident.save
      redirect "/managers/#{session[:user_id]}"
    end 
  end

end
