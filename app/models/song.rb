class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(genre_id)
    self.genre = Genre.find_by(id: genre_id)
  end

  def genre_id
    self.genre ? self.genre.id : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      note = Note.create(content: content)
      self.notes << note
    end
  end

end
