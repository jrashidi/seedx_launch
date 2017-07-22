class SignupMailer < ApplicationMailer
  default from: 'from@example.com'

  def send_confirmation_email(user)
    @user = user
    delivery_options = { user_name: ENV["SENDGRID_USERNAME"],
                         password: ENV["SENDGRID_PASSWORD"],
                         address: 'smtp.sendgrid.net' }
    mail( to: @user.email,
    subject: 'Thanks for signing up for our amazing app',
    delivery_method_options: delivery_options )
  end
end
