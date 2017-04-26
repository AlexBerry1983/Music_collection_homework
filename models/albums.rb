require('pg')
require_relative('../db/sql_runner')
require_relative('artists')


class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i if options['artist_id']
  end

# INSTANCE METHODS

  def save
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ('#{@title}', '#{genre}', #{artist_id}) RETURNING id;"
    result = SqlRunner.run(sql)
    result_hash = result.first()
    new_id = result_hash['id']
    @id = new_id
  end

  # def find_artist
  #   sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
  #   result_pg = SqlRunner.run(sql)
  #   artist_hash = result_pg.first
  #   artist_object_rb = Artist.new(artist_hash)
  #   return artist_object_rb  
  # end

# CLASS METHODS
  def self.all
    sql = "SELECT * FROM albums"
    albums_array = SqlRunner.run(sql)
    albums = albums_array.map do |album| Album.new(album)
    end
    return albums
  end



  # def self.find_all_by(artist_id)
  #   sql = "SELECT * FROM albums WHERE artist_id = #{artist_id} "
  # end

  # def self.find_all_by(artist)
  #   artist_id = artist.id
  #   sql = "SELECT * FROM albums WHERE artist_id = #{artist_id}"

  end