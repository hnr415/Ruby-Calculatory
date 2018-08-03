require './config/environment'
require './app/models/sample_model'
require './app/models/calc'
# require 'httparty'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    return erb :index
  end
  
  post '/results' do
    @qx = params["calc"]
    puts @qx
    @b = params["nums"]
    @c = get_expression(@qx, @b)
    puts @c['result']
    return erb :results
  end
end
    
    
