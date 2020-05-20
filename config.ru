# The first new convention this pattern introduces is a config.ru file. 
# The purpose of config.ru is to detail to Rack the environment requirements of the application and start the application.
require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
# mount controllers so they may be used.
# you can only run one controller the rest is middleware
run ApplicationController
use BooksController
use UserController
use ReviewsController
