class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = User.find(3)

    mail(to: "kemack83@gmail.com", subject: 'Welcome para testear')
  end
end
