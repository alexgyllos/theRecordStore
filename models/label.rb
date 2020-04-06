require_relative('../db/sql_runner')
require_relative('./artist')

class Label

  attr_reader :id
  attr_accessor :name, :contact, :active

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact = options['contact']
    @active = options['active']
  end

  def save()
    sql = "INSERT INTO labels (name, contact, active)
           VALUES ($1, $2, $3)
           RETURNING id"
    values = [@name, @contact, @active]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE labels SET (name, contact, active) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @contact, @active, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM labels WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def artists()
    sql = "SELECT artists.* FROM artists
           INNER JOIN labels
           ON artists.label_id = labels.id
           WHERE labels.id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|artist| Artist.new(artist)}
  end

  def Label.all()
    sql = "SELECT * FROM labels"
    results = SqlRunner.run(sql)
    return results.map {|label_hash| Label.new(label_hash)}
  end

  def Label.find(id)
    sql = "SELECT * FROM labels WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Label.new(results.first)
  end

  def Label.delete_all()
    sql = "DELETE FROM labels"
    SqlRunner.run(sql)
  end
end
