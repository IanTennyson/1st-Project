require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/cocktails_controller')
require_relative('controllers/ingredients_controller')
require_relative('controllers/ingredients_list_controller')
require_relative('controllers/measures_controller')

get '/' do
  erb( :index )
end

# Is it possible to pull info in my cocktails table from my measures table? 
#  id | ing1_id | ing2_id | ing3_id | ing4_id 
# ----+---------+---------+---------+---------
#  47 |     246 |     252 |     250 |     251
#  48 |     252 |     251 |     250 |     249

#How to achieve this?
#  id | ing1_id | ing2_id | ing3_id | ing4_id 
# ----+---------+---------+---------+---------
#  47 |   tequila |   25ml |
#  48 |     vodka |   50ml |


# Does a method have to be a self method to be used in a controller file? 

#my new ingredient page. How can it work if I have already referenced a id from my measures page?

#delete my excess controller files.
#Should my cost price, sale price and profit be in my ingredients? 
#Should I have them at all?
#hard code my cost price, sale price and profit? 