class Author < ActiveRecord::Base
  validates :link, presence: true

  has_many :articles
  has_many :posts

  def author_home_link
    if uri = URI(self.link)
      link = self.posts.first.post_link
      uri_tmp = URI(link)
      uri_tmp.scheme + "://" + uri_tmp.host + self.link
    else
      self.link
    end
  end
end
