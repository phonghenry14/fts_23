class UserMailer < ApplicationMailer
  def examination_checked examination, user
    @greeting = "Hi #{user.name}"
    @examination = examination

    mail to: user.email, subject: "Ruby on Rails website"
  end
end
