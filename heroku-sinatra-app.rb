# Remember to run the server when testing locally
# by going ruby heroku-sinatra-app.rb
# then go to localhost:4567 in your browser
#
require 'debugger' if development?
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/bike.rb'
require './lib/station.rb'

# for templates uncomment the line below
require 'erb'
helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end


get '/' do
  # This will be your default route
  # name = "Michelle"  
  # erb :index, :locals => {:name => name}
  erb :index
end

get '/start' do
  bikes = Array.new(10) {Bike.new}
  erb :start, :locals => {:bikes => bikes}
end

get '/station_report' do
  @stations = Array.new(5) {Station.new}
  erb :station_report #:locals => {:stations => stations}
end



# Test at <appname>.heroku.com (you'll need to create your app first!)