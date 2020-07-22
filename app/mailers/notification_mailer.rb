class NotificationMailer < ApplicationMailer
  
  default from: "kaku.takanori.1026@gmail.com"
  
  def secret_mail(user, admin)
    @user = user
    @admin = admin
    mail(
      from: @admin.email,
      to: @user.email,
      subject: '面会用パスワード'
    )
  end
end
