require 'bundler/setup'
require 'sinatra/base'
require 'json'

class Api < Sinatra::Base
  get '/hello' do
    'Hello world!'
  end

  get '/movies' do
    file = File.read('data.json')
    movies = JSON.parse(file)
    movies['movies'].to_s
  end

  get '/movies/:id' do
    file = File.read('data.json')
    movies = JSON.parse(file)
    movies['movies'].each do |movie|
      return movie.to_s if movie['id'] == params[:id].to_i
    end
  end
end
