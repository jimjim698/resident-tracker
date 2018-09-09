class SanctionController < ApplicationController

  post '/sanctions/new' do
    raise params.inspect
    erb :'/sanctions/add_sanction'
  end


end
