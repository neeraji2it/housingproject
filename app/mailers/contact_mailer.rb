class ContactMailer < ActionMailer::Base
  default from: "from@example.com"
  def contact( email, name,  mobile)
    @name = name
    @email = email
    @mobile = mobile
        mail(:to =>"rkaniradha@gmail.com", :subject => " housing customer waiting to contact you")
  end
end
