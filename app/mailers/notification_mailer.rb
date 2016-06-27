class NotificationMailer < ApplicationMailer
  default from: "pon.kurose.test@gmail.com"

  def post_notice_email(user)
    @user = user
    sitename = ENV["SITE_NAME"]
    mail to: @user.email, subject: "【#{sitename}】新しい通知があります。"
  end
end