require 'sinatra'
require 'json'

def fetch(uri_str)
  JSON.load(`curl -L #{uri_str}`)
end

get '/' do
  erb :index
end

get '/planets' do
  planet_json = fetch('https://swapi.co/api/planets')
  @planets = planet_json["results"]

  erb :planets
end

get '/people' do
  people_json = fetch('https://swapi.co/api/people')
  @people = people_json["results"]

  erb :people
end
