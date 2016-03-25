class Subject < ActiveRecord::Base

	has_many :pages

	scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("subjects.position ASC") }
  scope :newest_first, lambda {order("subjects.created_at DESC")}
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

end

# % are wild cards, so %query% doesn't have to match exactly - it can be a substring

# ! IMPORTANT ! a scope is the same as writing:

# def self.visible
# 	where (:visible => true)
# end

# or 

# def self.sorted
# 	order ("subject.position ASC")
# end

# lambda's are evaluated when called, each time they are called
# so if you are doing something with time/date it's best to use lambda 