class Contact < ActionMailer::Base
  default from: "from@example.com"
  def contact(name, email, mobile)
    @name = name.capitalize!
    @email = email
    @mobile = mobile
    mail(:to =>"rkaniradha@gmail.com", :subject => " housing customer waiting to contact you")
  end
  
  def send_contact(a, b, c, d, e, f)
    @a=a
    @b=b
    @c=c
    @d=d
    @e=e
    @f=f
    mail(:to =>"svrforms@gmail.com", :subject => "User Requirements")
  end
  
end