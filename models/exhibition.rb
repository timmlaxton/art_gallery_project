require_relative('../db/sql_runner')

class Exhibition

attr_reader :name, :opening, :closing, :entry_fee, :id

def initialize(options)
  @id = options['id'].to_i
  @name = options['name']
  @opening = options['opening']
  @closing = options['closing']
  @entry_fee = options['entry_fee']

  def save()
    sql = "INSERT INTO exhibitions
    (
      name,
      opening,
      closing,
      entry_fee
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@name, @opening, @closing, @entry_fee]
    gallery_data = SqlRunner.run(sql, values)
    @id = gallery_data.first()['id'].to_i
    end
end
end
