require_relative( '../db/sql_runner' )

class Ingredient

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @measure_id = options['measure_id']
    @price = options['price'].to_i
    @is_alcoholic = options['is_alcoholic'] 
  end

  def save()
    sql = "INSERT INTO ingredients (name, measure_id, price, is_alcoholic) VALUES ( '#{@name}', #{@measure_id}, '#{@price}', #{@is_alcoholic} ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end
end