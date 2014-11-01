class Author < ActiveRecord::Base
  validates :link, presence: true

  has_many :articles
  has_many :posts
end
