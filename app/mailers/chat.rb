class Chat < ActionMailer::Base
  default from: "from@example.com"
  def contact( email, name, phone, message )
    @name = name
    @email = email
    @phone = phone
    @message = message

    mail(:to =>"rkaniradha@gmail.com", :subject => " housing customer waiting to contact you")
  end
end
