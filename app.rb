require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/cocktails_controller')
require_relative('controllers/ingredients_controller')
require_relative('controllers/ingredients_list_controller')
require_relative('controllers/measures_controller')

get '/' do
  erb( :index )
end

