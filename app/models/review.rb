# == Schema Information
#
# Table name: reviews
#
#  id           :integer         not null, primary key
#  review_body  :string(255)
#  rating       :float
#  helpfullness :integer
#  flag         :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Review < ActiveRecord::Base
	belongs_to :list
end
