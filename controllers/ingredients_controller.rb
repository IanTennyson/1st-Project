require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/ingredients.rb' )

get '/ingredients' do
  @alc_ingredients = Ingredient.all_alcoholic()
  @non_alc_ingredients = Ingredient.all_non_alcoholic()
  @quantity = Ingredient.all_quantities_by_id()
  @total_cost_price = Ingredient.total_stock_cost_price()

  erb( :"ingredients/index" )
end