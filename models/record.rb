require_relative('../db/sql_runner')
require_relative('./artist')

class Record

  attr_reader :id
  attr_accessor :record_name, :artist_id, :genre, :stock, :buying_cost, :selling_price, :markup

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @record_name = options['record_name']
    @artist_id = options['artist_id'].to_i
    @genre = options['genre'].to_s
    @stock = options['stock'].to_i
    @buying_cost = options['buying_cost'].to_i
    @selling_price = options['selling_price'].to_i
  end

  def save()
    sql = "INSERT INTO records (record_name, artist_id, genre, stock, buying_cost, selling_price)
           VALUES ($1, $2, $3, $4, $5, $6)
           RETURNING id"
    values = [@record_name, @artist_id, @genre, @stock, @buying_cost, @selling_price]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE records SET (record_name, artist_id, genre, stock, buying_cost, selling_price) = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@record_name, @artist_id, @genre, @stock, @buying_cost, @selling_price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM records WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def artists()
    sql = "SELECT artists.* FROM artists
           INNER JOIN records
           ON records.artist_id = artists.id
           WHERE artist_id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    return results.map {|artist| Artist.new(artist)}.first()
  end

  # GIVEN I have a selling_price variable that is equal to 15 and a buying_cost variable that is equal to 5
  # WHEN I run the calculate_markup method on an record object
  # THEN I will receive a markup of 10

  def calculate_markup()
    markup = @selling_price - @buying_cost
    return markup
  end

  def check_stock()
    if @stock >= 6
      return @stock
    elsif @stock <= 5 && @stock > 0
      return "#{@stock} - Low Stock"
    elsif @stock == 0
      return "#{@stock} - Out of Stock"
    end
  end

  def Record.find(id)
    sql = "SELECT * FROM records WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Record.new(results.first)
  end

  def Record.all()
    sql = "SELECT * FROM records"
    results = SqlRunner.run(sql)
    return results.map {|records_hash| Record.new(records_hash)}
  end

  def Record.delete_all()
    sql = "DELETE FROM records"
    SqlRunner.run(sql)
  end

end
