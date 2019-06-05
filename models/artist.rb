require_relative('../db/sql_runner')

class Artist

  attr_reader :name, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@name]
    gallery_data = SqlRunner.run(sql, values)
    @id = gallery_data.first()['id'].to_i
    end

  def update()
    sql - "UPDATE artists
    SET
    (
      name
    )
    VALUES
    (
      $1
    )
    WHERE id = $2"
    values = [@name, @id]
    Sql Runner.run(sql, values)
  end

  def delete()
  sql = "DELETE FROM artists
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
  end

  def self.delete_all()
  sql = "DELETE FROM artists"
  SqlRunner.run(sql)
  end

  def self.all()
  sql = "SELECT * from artists"
  artists = SqlRunner.run(sql)
  result = artists.map { |artist| Artist.new(artist)}
  return result
  end

  def self.find(id)
  sql = "SELECT * FROM artists WHERE id = $1"
  values = [id]
  artist = SqlRunner.run(sql, values)
  return Artist.new(artist)
  end

  def exhibition()
    sql = "SELECT * FROM exhibitions WHERE artist_id = $1"
    values = [@id]
    exhibitions = SqlRunner.run(sql, values)
    return exhibitions.map { |exhibitions| Exhibtion.new(exhibit) }
  end

end
