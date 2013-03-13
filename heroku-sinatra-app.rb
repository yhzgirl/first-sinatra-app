# Remember to run the server when testing locally
# by going ruby heroku-sinatra-app.rb
# then go to localhost:4567 in your browser
#
# require 'debugger' if development?
require 'bundler/setup'
require 'sinatra'
#require 'sinatra/shotgun' if development?
require 'data_mapper'
require "dm-migrations"
require './lib/bike.rb'
require './lib/station.rb'
require './lib/person.rb'


# for templates uncomment the line below
require 'erb'
helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end

connection = "postgres://localhost:5432/boris_bikes"
DataMapper.setup(:default, ENV["DATABASE_URL"] || connection)

DataMapper.finalize.auto_upgrade!

get '/' do
  # This will be your default route
  # name = "Michelle"  
  # erb :index, :locals => {:name => name}
  erb :index
end

# RESTFUL ARCHITECTURE
# # Index, New, Destroy, Update, Create, Edit, Show
# Get-Index, Get-Show, Get-New, Get-Edit
# Post-Create
# Put-Update
# Delete-Destroy

post '/create_system' do
  # params[:no_bikes].to_i
  Array.new(params[:no_bikes].to_i) {Bike.new.save} #why does .create not work?
  Array.new(params[:no_stations].to_i) {Station.new.save}
  Array.new(params[:no_people].to_i) {Person.new.save}
  # @vans = Array.new(2) {Van.create}
  # @garages = Array.new(2) {Garage.create}
  redirect "/report"
end


get '/report' do
  erb :report
end

get '/station_report' do
  erb :station_report #:locals => {:stations => stations}
end

get '/bike_report' do
  erb :bike_report
end

# get '/people_report' do
#   erb :people_report
# end

get '/delete_bikes' do
  Bike.destroy
  erb :delete_bikes
end

get '/delete_stations' do
  Station.destroy
  erb :delete_stations
end


# Test at <appname>.heroku.com (you'll need to create your app first!)