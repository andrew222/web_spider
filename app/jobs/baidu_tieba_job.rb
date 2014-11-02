# encoding: utf-8

# VVERBOSE=1 QUEUE=* rake resque:work
# Resque.enqueue(BaiduTiebaJob, article_id)
class BaiduTiebaJob
  @queue = :baidu_tieba_job

  def self.perform(article_id)
    spider = BaiduTieba::Tieba.new
    spider.spider_tieba(article_id)
  end
end
