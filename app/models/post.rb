class Post < ApplicationRecord
  belongs_to :author

  validates :titre, presence: true
  validates :description, presence: true
  validates :published, presence: true
  validates :published_at, presence: true
  validates :author, presence: true
end
