require_relative('../db/sql_runner')
require_relative('./artist')

class Record

  attr_reader :id
  attr_accessor :name, :artist_id, :genre, :stock, :buying_cost, :selling_price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @artist_id = options['artist_id']
    @genre = options['genre'].to_s
    @stock = options['stock']
    @buying_cost = options['buying_cost']
    @selling_price = options['selling_price']
  end

  def save()
    sql = "INSERT INTO records (name, artist_id, genre, stock, buying_cost, selling_price)
           VALUES ($1, $2, $3, $4, $5, $6)
           RETURNING id"
    values = [@name, @artist_id, @genre, @stock, @buying_cost, @selling_price]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE records SET (name, artist_id, genre, stock, buying_cost, selling_price) = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@name, @artist_id, @genre, @stock, @buying_cost, @selling_price, @id]
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

  def markup()
    markup = @selling_price - @buying_cost
    return markup
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
