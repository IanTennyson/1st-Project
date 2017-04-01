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



ingredient1 = Ingredient.new({ 'name' => 'Vodka', 'measure_id' => fifty_ml.id, 'price_per_ltr' => 15.0, 'is_alcoholic' => true, 'quantity' => 7 })
ingredient1.save()

ingredient2 = Ingredient.new({ 'name' => 'Gin', 'measure_id' => fifty_ml.id, 'price_per_ltr' => 15.0, 'is_alcoholic' => true, 'quantity' => 5  })
ingredient2.save()

ingredient3 = Ingredient.new({ 'name' => 'Rum', 'measure_id' => fifty_ml.id, 'price_per_ltr' => 15.0, 'is_alcoholic' => true, 'quantity' => 10  })
ingredient3.save()

ingredient4 = Ingredient.new({ 'name' => 'Tequila', 'measure_id' => fifty_ml.id, 'price_per_ltr' => 28.58, 'is_alcoholic' => true, 'quantity' => 4  })
ingredient4.save()

ingredient5 = Ingredient.new({ 'name' => 'Orange', 'measure_id' => fifty_ml.id, 'price_per_ltr' => 1.23, 'is_alcoholic' => false, 'quantity' => 10 })
ingredient5.save()

ingredient6 = Ingredient.new({ 'name' => 'Cranberry', 'measure_id' => fifty_ml.id, 'price_per_ltr' => 1.98, 'is_alcoholic' => false, 'quantity' => 10 })
ingredient6.save()

ingredient7 = Ingredient.new({ 'name' => 'Peach Schnapps', 'measure_id' => twentyfive_ml.id, 'price_per_ltr' => 7.50, 'is_alcoholic' => true, 'quantity' => 9  })
ingredient7.save()





ingredients_list1 = IngredientList.new({ 'ing1_id' => ingredient1.id, 'ing2_id' => ingredient7.id, 'ing3_id' => ingredient5.id, 'ing4_id' => ingredient6.id })
ingredients_list1.save()




cocktail1 = Cocktail.new({ 'name' => 'You Sexy Beach', 'ing_list_id' => ingredients_list1.id, 'prep_description' => 'Regurgitate to the masses.'})
cocktail1.save()

binding.pry
nil