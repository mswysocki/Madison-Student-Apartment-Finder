# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  Name       :string(255)
#  Email      :string(255)
#  Admin      :boolean
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
