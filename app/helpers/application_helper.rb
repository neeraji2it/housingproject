module ApplicationHelper
  include Mobvious::Rails::Helper

  
  def device_test
    "#{@device}"
  end  
  
    
  
end