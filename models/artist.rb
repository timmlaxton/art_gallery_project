require_relative('../db/sql_runner')

class Artist

  attr_reader :name, :id

  def initialize( options )
    @id = options['id'].to_i
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

end
