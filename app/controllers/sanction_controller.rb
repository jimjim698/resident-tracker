class SanctionController < ApplicationController

  post '/sanctions/new' do
    @resident = Resident.find_by_id(params[:id])

    erb :'/sanctions/add_sanction'
  end

  post '/sanctions/show' do
    @resident = Resident.find_by_id(params[:id])
    @sanction = Sanction.create(params[:sanction])
    binding.pry
    @resident.sanctions << @sanction
    @sanction.save
    @resident.save
    erb :'/sanctions/show'

  end


end
