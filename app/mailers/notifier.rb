class Notifier < ActionMailer::Base
  default from: "webspide101@gmail.com"
  
  def new_post_email(post_arr)
    @posts_arr = post_arr
    mail(to: "qqerqqer@126.com", subject: "new post")
  end
end
