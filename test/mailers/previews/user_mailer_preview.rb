# Preview all emails at http://localhost:3000/rails/mailers/user_mailer/
class UserMailerPreview < ActionMailer::Preview

    # http://localhost:3000/rails/mailers/user_mailer/user_updated_information
    def user_upated_information
        user = User.last
        UserMailer.user_show_page(user)
    end

end
