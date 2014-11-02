class Article < ActiveRecord::Base
  validates :url, presence: true

  has_many :posts, dependent: :destroy
  belongs_to :author
  belongs_to :forum
end
