class ResidentController < ApplicationController

  get '/residents/new' do
    erb :'/residents/add_resident'
  end 

end
