require_relative( '../models/measures.rb' )
require_relative( '../models/ingredients.rb' )
require_relative( '../models/ingredients_list.rb' )
require_relative( '../models/cocktails.rb' )
require('pry-byebug')

Cocktail.delete_all()
IngredientList.delete_all()
Ingredient.delete_all()
Measure.delete_all()

five_ml = Measure.new({ 'ml' => '5' })
five_ml.save()
ten_ml = Measure.new({ 'ml' => '10' })
ten_ml.save()
fifteen_ml = Measure.new({ 'ml' => '15' })
fifteen_ml.save()
twenty_ml = Measure.new({ 'ml' => '20' })
twenty_ml.save()
twentyfive_ml = Measure.new({ 'ml' => '25' })
twentyfive_ml.save()
fifty_ml = Measure.new({ 'ml' => '50' })
fifty_ml.save()



ingredient1 = Ingredient.new({ 'name' => 'Vodka', 'measure_id' => fifty_ml.id, 'price_per_ltr' => 15.0, 'is_alcoholic' => true })
ingredient1.save()

ingredient2 = Ingredient.new({ 'name' => 'Gin', 'measure_id' => fifty_ml.id, 'price_per_ltr' => 15.0, 'is_alcoholic' => true })
ingredient2.save()

ingredient3 = Ingredient.new({ 'name' => 'Rum', 'measure_id' => fifty_ml.id, 'price_per_ltr' => 15.0, 'is_alcoholic' => true })
ingredient3.save()

ingredient4 = Ingredient.new({ 'name' => 'Tequila', 'measure_id' => fifty_ml.id, 'price_per_ltr' => 28.58, 'is_alcoholic' => true })
ingredient4.save()

ingredient5 = Ingredient.new({ 'name' => 'Orange Juice', 'measure_id' => fifty_ml.id, 'price_per_ltr' => 1.23, 'is_alcoholic' => false})
ingredient5.save()


ingredients_list1 = IngredientList.new({ 'ing1_id' => ingredient1.id, 'ing2_id' => ingredient2.id, 'ing3_id' => ingredient3.id, 'ing4_id' => ingredient4.id })
ingredients_list1.save()

cocktail1 = Cocktail.new({ 'name' => 'Hot Mess', 'ing_list_id' => ingredients_list1.id, 'prep_description' => 'The hot mess, illegal in most countries.'})
cocktail1.save()

binding.pry
nil