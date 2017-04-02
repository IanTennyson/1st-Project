require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/cocktails.rb' )
require_relative( '../models/ingredients_list.rb' )
require_relative( '../models/ingredients.rb' )
require_relative( '../models/measures.rb' )


get '/cocktails' do
  @ingredients = Ingredient.all()
  @measures = Measure.all()
  @cocktails = Cocktail.all
  
  erb( :"cocktails/index" )
end