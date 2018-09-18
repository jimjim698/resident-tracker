class SanctionController < ApplicationController


  get '/sanctions/:id/add' do
    @resident = Resident.find_by_id(params[:id])
    erb :'/sanctions/add_sanction'
  end

  get '/sanctions/:id/remove' do
    @resident = Resident.find_by_id(params[:id])
    erb :'/sanctions/remove'
  end


  post '/sanctions/new' do
    not_logged_in
    @resident = Resident.find_by_id(params[:id])

    if @resident.sanctions.detect{|sanction| sanction.name == params[:name]} || params[:name] == ""
      erb :'/sanctions/show'
    else
    @sanction = Sanction.create(name: params[:name])
    @resident.sanctions << @sanction
    @sanction.save
    @resident.save
  end
    erb :'/sanctions/show'

  end



  post '/sanctions/remove' do
    not_logged_in
    @resident = Resident.find_by_id(params[:resident][:id])
    @sanctions=[]

    if !params[:resident][:sanction_ids]
      @resident.sanctions = @sanctions
      @resident.save
      erb :'/sanctions/show'
    else
    params[:resident][:sanction_ids].each do |s_id|
      @sanctions<< Sanction.find_by_id(s_id)
    end
      @resident.sanctions = @sanctions
      @resident.save
    end
      erb :'/sanctions/show'

  end






end
