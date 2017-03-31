require_relative( '../db/sql_runner' )

class Measure

  attr_reader ( :id )

  def initialize(options)
    @id = options['id'].to_i
    @ml = options['ml'].to_i
  end

  def save()
    sql = "INSERT INTO measures (ml) VALUES ( '#{@ml}' ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE measures SET (ml) = ('#{@ml}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM measures WHERE id = #{@id}"
    SqlRunner.run(sql)
  end



  def self.delete_all()
    sql = "DELETE FROM measures"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM measures"
    results = SqlRunner.run( sql )
    return results.map { |hash| Measure.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM measures WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Measure.new( results.first )
  end

  def self.map_items(sql)
    measures = SqlRunner.run(sql)
    return measures.map { |measure| Measure.new(measure) }
  end

end