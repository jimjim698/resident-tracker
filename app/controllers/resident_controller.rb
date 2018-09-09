class ResidentController < ApplicationController

  get '/residents/new' do
    erb :'/residents/add_resident'
  end

  post '/residents/new' do
    @manager = Manager.find_by_id(session[:user_id])
    if @manager.residents.detect {|resident| resident.name == params[:resident][:name].capitalize} || params[:resident][:name]=="" || params[:resident][:age] == "" || params[:resident][:room_number] == ""

      redirect '/residents/new'
    else
      @resident = Resident.new(params[:resident])
      @resident.name = @resident.name.capitalize
      @resident.manager_id = session[:user_id]
      @resident.save
      redirect "/managers/#{session[:user_id]}"
    end
  end

  get '/residents/:id' do
    @resident = Resident.find_by_id(params[:id])
    erb :'/residents/show'


  end

end
