require 'sinatra/base'

# my_app.rb
class MyApp < Sinatra::Base
  set :sessions, true

  get '/' do
    'Hello world'
  end
end
