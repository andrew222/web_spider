class Post < ActiveRecord::Base
  validates :posted_at, :author_id, presence: true
end
