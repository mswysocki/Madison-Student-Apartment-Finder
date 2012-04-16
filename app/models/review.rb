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
	
	profanity_filter! :review_body
	
	
end
