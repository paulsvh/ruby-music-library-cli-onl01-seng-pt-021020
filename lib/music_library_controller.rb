class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip

      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
    end
  end

  def list_songs #prints all songs (w/ artist and genre) in the library in a numbered list alphabetized by song name
    Song.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists #print all artists in library in a numbered list alphabetized by artist name
    Artist.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
  end

  def list_genres #print all genres in library in a numbered list alphabetized by genre name
    Genre.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |g, i|
      puts "#{i}. #{g.name}"
  end

  def list_songs_by_artist #takes user input for artist and returns that artists songs in an numbered list alphabetized by name
    puts "Enter the name of an artist."
    input = gets.strip
    if artist = Artist.find_by_name(input)
      artist.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |s, i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre #takes user input for genre and returns that genres songs in an numbered list alphabetized by name
    puts "Enter the name of an genre."
    input = gets.strip
    if genre = Genre.find_by_name(input)
      artist.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |s, i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def play_song #takes user input of a song number from #list_songs and puts "Playing #{song} by #{artist}".

  end

end
