class Article < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :author
  belongs_to :forum
end
