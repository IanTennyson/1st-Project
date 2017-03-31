require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/ingredients.rb' )

get '/ingredients' do
  @ingredients = Ingredient.all()
  erb( :"ingredients/index" )
end