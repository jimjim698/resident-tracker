class SanctionController < ApplicationController

  post '/sanctions/new' do
    @resident = Resident.find_by_id(params[:id])

    erb :'/sanctions/add_sanction'
  end

  post '/sanctions/show' do
    @resident = Resident.find_by_id(params[:id])
    if @resident.sanctions.detect{|sanction| sanction.name == params[:sanction][:name]} || params[:sanction][:name] == ""
      erb :'/sanctions/show'
    else
    @sanction = Sanction.create(params[:sanction])
    @resident.sanctions << @sanction
    @sanction.save
    @resident.save
  end
    erb :'/sanctions/show'

  end

  post '/sanctions/remove' do
    @resident = Resident.find_by_id(params[:id])
    erb :'/sanctions/remove'
  end

  put '/sanctions/remove' do
    @resident = Resident.find_by_id(params[:id])
    erb :'/sanctions/remove'
  end

  post '/sanctions/removed' do
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
