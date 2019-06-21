class UserMailer < ApplicationMailer

    defaults from: 'everybody@appacademy.io'

    def welcome_email(user)
        @user = user 
        @url = 'http://example.com/login'
        mail(to: user.email, subject: 'Welcome to 99 cats!')

    end
end
