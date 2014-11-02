# encoding: utf-8

# VVERBOSE=1 QUEUE=* rake resque:work
# Resque.enqueue(BaiduTiebaJob, article_id)
class BaiduTiebaJob
  @queue = :baidu_tieba_job

  def self.perform(article_id)
    p "*****************begin job"
    spider = BaiduTieba::Tieba.new
    if article_id == "All articles"
      Article.all.each do |a|
        spider.spider_tieba(a.id)
      end
    else
      spider.spider_tieba(article_id)
    end
  end
end
