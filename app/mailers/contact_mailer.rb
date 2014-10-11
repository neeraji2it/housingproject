class ContactMailer < ActionMailer::Base
  default from: "from@example.com"
  def contact( email, name,  mobile)
    @name = name
    @email = email
    @mobile = mobile
    mail(:to => ["Adisvr.369@gmail.com","chandrusvr82@gmail.com","naveencaaspirant@gmail.com"],  :subject => " housing customer waiting to contact you")

  end
  
  
  def contact_form(contactus,  message)
    @contactus = contactus
    @body = { :message => message}
    mail(:to => ["katta04.bhagath@gmail.com","smaranreddy123@gmail.com"],  :subject => " housing customer waiting to contact you")
  end
end
