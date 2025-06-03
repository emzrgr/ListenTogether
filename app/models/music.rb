class Music < ApplicationRecord
  belongs_to :mood

  validates :title, :album, :artist, presence: true
  validates :title, uniqueness: true

end
