# require './app/controllers/application_controller'
# setting the environment for the database 
ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# setup the adapter to sqlite
# setup connection
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

# requiring everything in app directory
require_all 'app'

