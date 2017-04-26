require('pg')
require_relative('../db/sql_runner')
require_relative('albums')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

end