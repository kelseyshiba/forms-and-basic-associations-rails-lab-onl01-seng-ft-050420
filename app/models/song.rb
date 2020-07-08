class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
  # genre_id => "Funk"
  # def genre_id=(name)
  #   genre = Genre.find_by(name: name) 
  #   self.genre_id = genre.id
  # end

  def notes=(notes)
    notes.each do |note|
    new_note = Note.create(content: note)
    self.notes << new_note
    end
  end
 

end
