require './heroku-sinatra-app'

## There is no need to set directories here anymore;
## Just run the application

run Sinatra::Application
#set :database, ENV['DATABASE_URL'] || 'postgres://localhost/[YOUR_DATABASE_NAME]'
