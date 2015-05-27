class Property < ActiveRecord::Base
  has_attached_file :document
  validates_attachment_content_type :document, :content_type => ["application/msword","text/plain",'application/pdf'], :message => 'Only PDF, WORD or TEXT files are allowed. '
  #validates_attachment_presence :document
  validates :location, :city, :description, :state,:city,:email, :presence => true
    has_many :images , :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if=>:all_blank
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 100000000}
    validates :area, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 1000000}
  validates :mobile, :presence => true, format: { with: /\A\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\Z/,
    message: "  must be in xxx-xxx-xxxx format" } 
  validates :latitude , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  # acts_as_gmappable :check_process=> false, :msg => "Errrrrrrror"
 
  
   after_validation :geocode
 geocoded_by :address

def address
 [latitude, longitude].compact.join(', ')
end  
  
  
def gmaps4rails_address
 "#{self.latitude}, #{self.longitude} "
end

  def gmaps4rails_infowindow
    "<b>City:&nbsp;</b>#{self.city}<br /><b>Location:&nbsp;</b> #{self.location} <br /><a href='/home/land1?id=#{self.id}' class='btn'>Property</a>"
  end
          
 
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end



