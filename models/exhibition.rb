require_relative('../db/sql_runner')

class Exhibition

attr_reader  :id
attr_accessor :name, :opening, :closing, :entry_fee, :artist_id

def initialize(options)
  @id = options['id'].to_i if options["id"]
  @name = options['name']
  @opening = options['opening']
  @closing = options['closing']
  @entry_fee = options['entry_fee']
  @artist_id = options['artist_id']
end


  def artist()
  sql = "SELECT * FROM artist WHERE id = $1"
  values = [@artist_id]
  artist = SqlRunner.run(sql, values)[0]
  returnArtist.new(artist)
  end

  def delete()
  sql = "DELETE FROM exhibitions
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
  end


  def self.delete_all()
  sql = "DELETE FROM exhibitions"
  SqlRunner.run(sql)
  end


  def save()
    sql = "INSERT INTO exhibitions
    (
      name,
      opening,
      closing,
      entry_fee,
      artist_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING *"
    values = [@name, @opening, @closing, @entry_fee, @artist_id]
    gallery_data = SqlRunner.run(sql, values)
    @id = gallery_data.first()['id'].to_i
    end

    def update()
    sql ="UPDATE exhibitions
    SET
    (
      name,
      opening,
      closing,
      entry_fee,
      artist_id
    )
    =
    (
      $1, $2, $3, $4, $5
    )
    where ID = $6"
    values = [@name, @opening, @closing, @entry_fee, @artist_id, @id]
    SqlRunner.run(sql, values)
    end


  def self.all()
  sql = "SELECT * FROM exhibitions"
  exhibits = SqlRunner.run(sql)
  result = exhibits.map { |exhibit| Exhibition.new( exhibit)}
  return result
  end

  def self.find(id)
  sql = "SELECT * FROM exhibitions WHERE id = $1"
  values = [id]
  exhibition = SqlRunner.run(sql, values)
  result = Exhibition.new(exhibition.first)
  return result
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run(sql, values)[0]
    return Artist.new(artist)
  end


end
