class Page < ActiveRecord::Base

	belongs_to :subject
	has_and_belongs_to_many :editors, :class_name => "AdminUser"
	#this creates and alias & specifies that when we say 'editors' we are refering to the class AdminUser

end
