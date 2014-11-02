class Article < ActiveRecord::Base
  after_save :add_spider_to_resque

  validates :url, presence: true

  has_many :posts, dependent: :destroy
  belongs_to :author
  belongs_to :forum

  private
    def add_spider_to_resque
      Resque.enqueue(BaiduTiebaJob, self.id)
    end
end
