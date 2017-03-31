require_relative( '../db/sql_runner' )

class Ingredient

  attr_reader :id, :name, :is_alcoholic, :price_per_ltr

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @measure_id = options['measure_id']
    @price_per_ltr = options['price_per_ltr'].to_f
    @is_alcoholic = options['is_alcoholic'] 
  end

  def save()
    sql = "INSERT INTO ingredients (name, measure_id, price_per_ltr, is_alcoholic) VALUES ( '#{@name}', #{@measure_id}, '#{@price_per_ltr}', #{@is_alcoholic} ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE ingredients SET (name, measure_id, price, is_alcoholic) = ( '#{@name}', #{@measure_id}, '#{@price_per_ltr}', #{@is_alcoholic} ) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM ingredients WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def price_per_ltr()
    sql = "SELECT price_per_ltr FROM ingredients WHERE id = #{@id}"
    return SqlRunner.run(sql).first().values().pop.to_f
  end

  def price_per_ml()
    cost_of_ltr = price_per_ltr()
    cost_of_ml = cost_of_ltr / 1000 
    return cost_of_ml
  end

  # def price_of_ingredient()
    
  # end



  def self.price_of_stock()
    sql = "SELECT ingredients.price_per_ltr FROM ingredients"
    return Ingredient.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM ingredients"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM ingredients"
    results = SqlRunner.run( sql )
    return results.map { |hash| Ingredient.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM ingredients WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Ingredient.new( results.first )
  end

  def self.map_items(sql)
    ingredients = SqlRunner.run(sql)
    return ingredients.map { |ingredient| Ingredient.new(ingredient) }
  end

end