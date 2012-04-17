require 'spec_helper'

describe Review do
  
  before (:each) do
    @attr = {
      :review_body =>  "value for content",
      :user_id => 1,
      :list_id => 1
    }
  end
  
  it "should create a new instance given valid attributes" do
    Review.create!(@attr)
  end
end
