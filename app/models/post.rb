class Post < ApplicationRecord
  belongs_to :author

  validates :titre, presence: true
  validates :description, presence: true
  validates :published, presence: true
  validates :published_at, presence: true
  validates :author, presence: true

  validates :categories, inclusion: { in: %w(dev ops tech business game),
                                      message: "%{value} is not a valid categorie" }

end
