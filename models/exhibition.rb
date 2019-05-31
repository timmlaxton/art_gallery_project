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

def self.delete_all()
  sql ="DELETE FROM exhibitions;"
  SqlRunner.run(sql)
end

def self.delete()
  sql = "DELETE FROM exhibitions
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM exhibitions"
  exhibits = SqlRunner.run(sql)
  result = exhibits.map { |exhibit| Exhibitions.new( exhibition)}
  return result
end

def self.find(id)
  sql = "SELECT * FROM exhibitions WHERE id = $1"
  values = [id]
  pizza = SqlRunner.run(sql, values)
  result = Exhibitions.new(exhibition.first)
  return result
end
end
