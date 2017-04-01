require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/ingredients.rb' )

get '/ingredients' do
  @alc_ingredients = Ingredient.all_alcoholic()
  @non_alc_ingredients = Ingredient.all_non_alcoholic()
  @cost_price = Ingredient.stock_cost_price()
  erb( :"ingredients/index" )
end