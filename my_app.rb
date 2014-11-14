require 'sinatra/base'
require './face_detect'

# my_app.rb
class MyApp < Sinatra::Base
  set :sessions, true

  get '/' do
    'Hello world'
  end

  get '/face_detect' do
    FaceDetect.run
  end
end
