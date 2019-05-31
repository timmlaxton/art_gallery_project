require_relative('../db/sql_runner')

class Artist

  attr_reader :name, :id

  def iniitialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end


end
