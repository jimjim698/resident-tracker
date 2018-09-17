class ResidentController < ApplicationController

  get '/residents/new' do
    not_logged_in
    erb :'/residents/add_resident'
  end

  post '/residents/new' do
    not_logged_in
    @manager = Manager.find_by_id(session[:user_id])
    if @manager.residents.detect {|resident| resident.name == params[:resident][:name].capitalize} || params[:resident][:name]=="" || params[:resident][:age] == "" || params[:resident][:room_number] == ""

      redirect '/residents/new'
    else
      @name = params[:resident][:name].split(" ").collect{|w| w.capitalize}.join(" ")
      @resident = Resident.find_or_create_by(name: @name)
      @resident.age= params[:resident][:age]
      @resident.room_number = params[:resident][:room_number]
      @resident.name = @resident.name.split(" ").collect{|w| w.capitalize}.join(" ")
      @resident.manager_id = session[:user_id]
      @resident.save
      redirect "/managers/#{session[:user_id]}"
    end
  end



  get '/residents/discharge' do
    not_logged_in
    @manager = Manager.find_by_id(session[:user_id])
    erb :'/residents/discharge'
  end

  post '/residents/discharge' do
    @residents = []
    @manager = Manager.find_by_id(session[:user_id])
    if params.empty?
      @manager.residents = @residents
      redirect "/managers/#{session[:user_id]}"
    else

    params[:manager][:resident_ids].each do |r_id|
    @residents << Resident.find_by_id(r_id)
  end
    @manager.residents = @residents
    @manager.save
    redirect "/managers/#{session[:user_id]}"
  end

  end

  delete '/residents/86' do
    @resident = Resident.find_by_id(params[:id])
    @resident.delete
    redirect "/managers/#{session[:user_id]}"
  end 



  get '/residents/:id' do
    not_logged_in
    @resident = Resident.find_by_id(params[:id])
    if @resident.manager.id == session[:user_id]
    erb :'/residents/show'
  else
    erb :'/access_denied'
  end

  end


end
