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

  def delete()
    sql = "DELETE FROM ingredients_lists WHERE id = #{@id}"
    SqlRunner.run(sql)
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

end