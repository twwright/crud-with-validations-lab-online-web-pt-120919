class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: %w[artist_name release_year] }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, numericality: { less_than: Date.current.year }, if: :released?
end
