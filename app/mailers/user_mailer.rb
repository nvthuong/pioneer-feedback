class UserMailer < ActionMailer::Base
  default from: 'feedback@wallem.com',
          to: 'dathi@tma.com.vn'

  def feedback(fb)
    ActionMailer::Base.smtp_settings = {
        :address => 'smtp.gmail.com',
        :port => 587,
        :domain => 'gmail.com',
        :authentication => :plain,
        :user_name => "wallemtmatest@gmail.com",
        :password => "12345678@X",
        :enable_starttls_auto => 1,
        :openssl_verify_mode => 'none'
    }

    @cc = fb[:cc]
    @subject = fb[:subject]
    @body = fb[:msg]

    mail(cc: @cc,
         subject: @subject).deliver!
  end
end
