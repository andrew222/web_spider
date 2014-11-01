class Forum < ActiveRecord::Base
  validates :url, presence: true

  has_many :articles
end
