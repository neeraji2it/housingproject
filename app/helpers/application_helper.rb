module ApplicationHelper
 include Mobvious::Rails::Helper

  
def device_test
  no_device = "What!? That's nil bro."
  if @device.nil?
    no_device
  else
    "#{@device}"
  end
end  
  
    
  
end