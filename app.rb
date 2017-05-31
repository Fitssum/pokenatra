require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/pokemon'

get '/pokemons/index' do #lists all pokemons (links with index.erb) - checked
  @pokemons = Pokemon.all
  erb :"pokemons/index"
end

get '/pokemons/new' do #creates forms for new pokemons (links with new.erb) - checked
  erb :"pokemons/new"
end

post '/pokemons/new' do #creates pokemons - checked
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemons/index"
end

get '/pokemons/:id' do #finds pokemons with their id (links with show.erb) - checked
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/show"
end

get "/pokemons/:id/edit" do #finds pokemons for updating/put - checked
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/edit"
end

put '/pokemons/:id' do #updates/puts pokemons
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect "/pokemons/:id/edit"
end

get "/pokemons/:id/delete" do #finds pokemons for deleting - checked
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/delete"
end

delete '/pokemons/:id' do #delets pokemons - checked
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect "/pokemons/index"
end
