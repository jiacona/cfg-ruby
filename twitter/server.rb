require 'sinatra'

get '/' do
  erb :form
end

get '/something' do
  'something really exciting'
end
