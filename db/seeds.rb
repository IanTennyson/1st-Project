require_relative( '../models/measures.rb' )
require_relative( '../models/ingredients.rb' )
require_relative( '../models/ingredients_lists.rb' )
require_relative( '../models/cocktails.rb' )
require('pry-byebug')

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

ingredient1 = Ingredient.new({ 'name' => 'Vodka', 'measure_id' => fifty_ml.id, 'price' => '15', 'is_alcoholic' => true })
ingredient1.save()

ingredient2 = Ingredient.new({ 'name' => 'Gin', 'measure_id' => fifty_ml.id, 'price' => '17', 'is_alcoholic' => true })
ingredient2.save()

ingredient3 = Ingredient.new({ 'name' => 'Rum', 'measure_id' => fifty_ml.id, 'price' => '19', 'is_alcoholic' => true })
ingredient3.save()

ingredient4 = Ingredient.new({ 'name' => 'Tequila', 'measure_id' => fifty_ml.id, 'price' => '20', 'is_alcoholic' => true })
ingredient4.save()



binding.pry
nil