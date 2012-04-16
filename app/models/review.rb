# == Schema Information
#
# Table name: reviews
#
#  id           :integer         not null, primary key
#  review_body  :string(255)
#  rating       :float
#  helpfulness :integer
#  flag         :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Review < ActiveRecord::Base
	belongs_to :list
	belongs_to :user
	
	# Line below was throwing an error. Commented it out for now.
	#profanity_filter! :review_body
	
	validates :user,               :presence => true
	validates :review_body,        :presence => true
	
	# Cannot have a validates :presence => false.  True is only boolean type allowed
	#validates :flag,               :presence => false
	#validates :helpfulness,        :presence => false
	#validates :rating,             :presence => false
	
	after_initialize :default_values
	def default_values
		self.flag ||= 0
		self.helpfulness ||= 0
		self.rating ||= 0
	end
	
	
end
