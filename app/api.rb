require 'bundler/setup'
require 'sinatra/base'

class Api < Sinatra::Base
  file = File.read('data.json')
  movies = JSON.parse(file)

  get '/hello' do
    'Hello world!'
  end

  get '/movies' do
    movies['movies'].to_s
  end

  get '/movies/:id' do
    movies['movies'].each do |movie|
      return movie.to_s if movie['id'] == params[:id].to_i
    end
  end
end
