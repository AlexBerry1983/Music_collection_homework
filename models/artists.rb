require('pg')
require_relative('../db/sql_runner')
# require_relative('albums')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id;"
    result = SqlRunner.run(sql)
    result_hash = result.first()
    new_id = result_hash['id']
    @id = new_id.to_i
  end

  def Artist.all
    sql = "SELECT * FROM artists"
    artist_hashes = SqlRunner.run(sql)
    artist_objects = artist_hashes.map do |artist| Artist.new(artist)
    end 
    return artist_objects
  end

  def find_all_albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    album_hashes_pg = SqlRunner.run(sql)
    album_objects_rb = album_hashes_pg.map do |album| Album.new(album)
    end
    return album_objects_rb
  end


end