class Page < ActiveRecord::Base

	belongs_to :subject
	has_and_belongs_to_many :editors, :class_name => "AdminUser"
	#this creates and alias & specifies that when we say 'editors' we are refering to the class AdminUser
	
	scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("pages.position ASC") }
  scope :newest_first, lambda {order("pages.created_at DESC")}
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

end
