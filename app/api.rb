require 'bundler/setup'
require 'sinatra/base'

class Api < Sinatra::Base
  file = File.read('data.json')
  movies = JSON.parse(file)['movies']

  get '/hello' do
    'Hello world!'
  end

  get '/movies' do
    movies.to_json
  end

  get '/movies/:id' do
    movies.each do |movie|
      return movie.to_json if movie['id'].to_s == params[:id]
    end
  end
end
