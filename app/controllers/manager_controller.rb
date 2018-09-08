class ManagerController < ApplicationController

  get '/signup' do
    erb :'/managers/create_manager'
  end



end
