require_relative( '../db/sql_runner' )
require('pry')

class Ingredient

  attr_reader :id, :name, :is_alcoholic, :price_per_ltr, :quantity, :cost_price, :sale_price, :profit

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @measure_id = options['measure_id']
    @price_per_ltr = options['price_per_ltr'].to_f
    @is_alcoholic = options['is_alcoholic'] 
    @quantity = options['quantity'].to_i
    @cost_price = options['cost_price'].to_f
    @sale_price = options['sale_price'].to_f
    @profit = options['profit'].to_f
  end

  def save()
    sql = "INSERT INTO ingredients (name, measure_id, price_per_ltr, is_alcoholic, quantity, cost_price, sale_price, profit) VALUES ( '#{@name}', #{@measure_id}, '#{@price_per_ltr}', #{@is_alcoholic}, #{@quantity}, #{cost_price}, #{sale_price}, #{profit} ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
    ingredient_cost_price()
    ingredient_sale_price()
    ingredient_profit()
  end

  def update()
    sql = "UPDATE ingredients SET (name, measure_id, price, is_alcoholic, quantity, cost_price, sale_price, profit) = ( '#{@name}', #{@measure_id}, '#{@price_per_ltr}', #{@is_alcoholic}, #{@quantity}, #{cost_price}, #{sale_price}, #{profit}) WHERE id = #{@id}"
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

  def quantity()
    sql = "SELECT quantity FROM ingredients WHERE id = #{@id}"
    return SqlRunner.run(sql).first().values().pop.to_i
  end

  def ingredient_cost_price()
    cost_price = price_per_ltr() * quantity()
    update_cost_price(cost_price)
    return cost_price
  end

  def update_cost_price(new_cost_price)
    sql = "UPDATE ingredients SET (cost_price) = (#{new_cost_price}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def ingredient_sale_price()
    sale_price = ingredient_cost_price() * 2.5
    update_sale_price(sale_price)
    return sale_price
  end

  def update_sale_price(new_sale_price)
    sql = "UPDATE ingredients SET (sale_price) = (#{new_sale_price}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def ingredient_profit()
    profit = ingredient_sale_price - ingredient_cost_price() 
    update_profit(profit)
    return profit
  end

  def update_profit(new_profit)
    sql = "UPDATE ingredients SET (profit) = (#{new_profit}) WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def price_per_ml()
    cost_of_ltr = price_per_ltr()
    cost_of_ml = cost_of_ltr / 1000 
    return cost_of_ml
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

  def self.all_alcoholic()
    sql = "SELECT * FROM ingredients WHERE is_alcoholic = 't'"
    return Ingredient.map_items(sql)
  end

  def self.all_non_alcoholic()
    sql = "SELECT * FROM ingredients WHERE is_alcoholic = 'f'"
    return Ingredient.map_items(sql)
  end

  def self.find( id )
    sql = "SELECT * FROM ingredients WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Ingredient.new( results.first )
  end


  def self.all_price_per_ltrs()
    sql = "SELECT price_per_ltr FROM ingredients"
    result = SqlRunner.run( sql ).values().flatten()
    ltr_price_array = result.map {|string| string.to_f}
    return ltr_price_array
  end

  def self.all_quantities()
    sql = "SELECT quantity FROM ingredients"
    quantity_string_array = SqlRunner.run( sql ).values().flatten()
    quantity_array = quantity_string_array.map{|string| string.to_f}
    return quantity_array
  end

  def self.all_quantities_by_id(id)
    sql = "SELECT quantity FROM ingredients WHERE id = #{id}"
    result = SqlRunner.run( sql )
    return Ingredient.new( result.first)
  end

  def self.stock_cost_price_array()
    [all_price_per_ltrs(), all_quantities()].transpose.map {|a| a.inject(:*)}
  end

  def self.total_stock_cost_price()
    sum = 0.0
    stock_cost_price_array.each{ |num|  sum+=num}
    return sum.round(2)
  end

  def self.map_items(sql)
    ingredients = SqlRunner.run(sql)
    return ingredients.map { |ingredient| Ingredient.new(ingredient) }
  end
  
end