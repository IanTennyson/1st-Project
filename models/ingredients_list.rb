require_relative( '../db/sql_runner' )

class IngredientList

  attr_reader ( :id )

  def initialize(options)
    @id = options['id'].to_i
    @ing1_id = options['ing1_id'].to_i
    @ing2_id = options['ing2_id'].to_i
    @ing3_id = options['ing3_id'].to_i
    @ing4_id = options['ing4_id'].to_i
  end

  def save()
    sql = "INSERT INTO ingredients_lists (ing1_id, ing2_id, ing3_id, ing4_id) VALUES ( #{@ing1_id}, #{@ing2_id}, #{@ing3_id}, #{@ing4_id} ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE ingredients_lists SET (ing1_id, ing2_id, ing3_id, ing4_id) = ( #{@ing1_id}, #{@ing2_id}, #{@ing3_id}, #{@ing4_id} ) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM ingredients_lists WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def ingredients_in_list
    ing_array = []
    sql="SELECT * FROM ingredients WHERE id = #{@ing1_id}"
    a = SqlRunner.run( sql ).first()
    sql="SELECT * FROM ingredients WHERE id = #{@ing2_id}"
    b = SqlRunner.run( sql ).first()
    sql="SELECT * FROM ingredients WHERE id = #{@ing3_id}"
    c = SqlRunner.run( sql ).first()
    sql="SELECT * FROM ingredients WHERE id = #{@ing4_id}"
    d = SqlRunner.run( sql ).first()
    ing_array<<a<<b<<c<<d
  end




  def self.delete_all()
    sql = "DELETE FROM ingredients_lists"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM ingredients_lists"
    results = SqlRunner.run( sql )
    return results.map { |hash| IngredientList.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM ingredients_lists WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return IngredientList.new( results.first )
  end

  def self.map_items(sql)
    ingredients_lists = SqlRunner.run(sql)
    return ingredients_lists.map { |ingredient_list| IngredientList.new(ingredient_list) }
  end

  # def self.zzz
  #   sql = "SELECT * FROM ingredients"
  #   result = SqlRunner.run(sql)
  #   return results.map{|hash}
  # end

end