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

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
