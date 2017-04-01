require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/ingredients.rb' )
require_relative( '../models/cocktails.rb' )

get '/ingredients' do
  @alc_ingredients = Ingredient.all_alcoholic()
  @non_alc_ingredients = Ingredient.all_non_alcoholic()
  
  @total_cost_price = Ingredient.total_stock_cost_price()


  erb( :"ingredients/index" )
end