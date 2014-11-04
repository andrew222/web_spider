# encoding: utf-8

# VVERBOSE=1 QUEUE=* rake resque:work
# Resque.enqueue(BaiduTiebaJob, article_id)
class BaiduTiebaJob
  @queue = :baidu_tieba_job

  def self.perform(article_id)
    p "*****************begin job"
    all_new_posts = []
    spider = BaiduTieba::Tieba.new
    if article_id == "All articles"
      Article.all.each do |a|
        all_new_posts << spider.spider_tieba(a.id)
      end
    else
      all_new_posts << spider.spider_tieba(article_id)
    end
    all_new_posts.flatten!
    if all_new_posts.size > 0
      Notifier.new_post_email(all_new_posts).deliver
    end
  end
end
