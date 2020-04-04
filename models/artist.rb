require_relative('../db/sql_runner')

class Artist

  attr_reader :id
  attr_accessor :name, :label_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @label_id = options['label_id'].to_i
  end

  def save()
    sql = "INSERT INTO artists (name, label_id)
           VALUES ($1, $2)
           RETURNING id"
    values = [@name, @label_id]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i
  end

  def update()
    sql = "UPDATE artists SET (name, label_id) = ($1, $2) WHERE id = $3"
    values = [@name, @label_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def label()
    sql = "SELECT labels.* FROM labels
           INNER JOIN artists
           ON artists.label_id = labels.id
           WHERE labels.id = $1"
    values = [@label_id]
    label = SqlRunner.run(sql, values).first()
    return label['name']
  end

  def records()
    sql = "SELECT records.* FROM records
           INNER JOIN artists
           ON artists.id = records.artist_id
           WHERE artists.id = $1"
    values = [@id]
    records = SqlRunner.run(sql, values)
    return records.map {|record| Record.new(record)}
  end

  def Artist.all()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    return results.map {|artist| Artist.new(artist)}
  end

  def Artist.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Artist.new(results.first)
  end

  def Artist.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end
end
