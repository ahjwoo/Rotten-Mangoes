class UserMailer < ActionMailer::Base
  default from: "rottenbananas@example.com"

  def delete_user(user)
    @user = user
    mail(to: @user.email, subject: 'Your account has been deleted!')
  end
end
