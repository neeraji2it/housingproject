class Contact < ActionMailer::Base
  default from: "from@example.com"
  def contact(name, email, mobile)
    @name = name.capitalize!
    @email = email
    @mobile = mobile
        mail(:to =>"rkaniradha@gmail.com", :subject => " housing customer waiting to contact you")
  end
end
