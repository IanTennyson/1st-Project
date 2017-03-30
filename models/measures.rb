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
end