class SignupMailer < ApplicationMailer
  default from: 'from@example.com'

  def email_confirmation(signup_queue)
    @signup_queue = signup_queue
    delivery_options = { user_name: '',
                         password: '',
                         address: 'smtp.sendgrid.net' }
    mail( :to => '',
    :subject => 'Thanks for signing up for our amazing app',
    delivery_method_options: delivery_options )
  end
end
