class Notifier < ActionMailer::Base
  default from: "webspide101@gmail.com"
  
  def new_post_email(post)
    @post = post
    mail(to: "qqerqqer@126.com", subject: "new post")
  end
end
