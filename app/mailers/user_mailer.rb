class UserMailer < ApplicationMailer

    def user_updated_information(user)
     @user = user 
     mail to: user.email , subject: "Updated Information"
    end
end
