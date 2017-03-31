require_relative( '../db/sql_runner' )

class Ingredient

  attr_reader ( :id )

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

  def delete
    sql = "DELETE FROM ingredients WHERE id = #{@id}"
    SqlRunner.run(sql)
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

end