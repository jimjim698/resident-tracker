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
    raise params.inspect
  end 




end
