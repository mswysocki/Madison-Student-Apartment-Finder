require 'test_helper'

class ListTest < ActiveSupport::TestCase
  # Replace this with your real tests.
	test "Creating list without any values" do
		list = List.new
		assert list.invalid?
		assert list.errors[:Address].any?
		assert list.errors[:Bedrooms].any?
		assert list.errors[:Zip].any?
		assert list.errors[:Rent].any?
	end
	
	test "Creating list with valid values" do
		list = List.new(:Address => "1234 Dayton Street",
							:Bedrooms => 4,
							:Zip => 12345,
							:Rent => 2000)
		assert list.valid?
		assert list.Address == "1234 Dayton Street"
		assert list.Bedrooms == 4
		assert list.Zip == 12345
		assert list.Rent == 2000
	end
	
	test "creating list with invalid values" do
		list = List.new(:Address => "1234 Dayton Street",
							:Bedrooms => 4,
							:Zip => 132345,
							:Rent => 2000)
		assert list.invalid?
	end	
	
	test "two listings with unique value" do
		list1 = List.new(:Address => "1234 Dayton Street",
							:Bedrooms => 4,
							:Zip => 12345,
							:Rent => 2000)
		assert list1.valid?
							
		list2 = List.new(:Address => "1234 Dayton Street",
							:Bedrooms => 4,
							:Zip => 13345,
							:Rent => 1500)
		assert list2.invalid?
	end
	
	test "Creation with wrong type of values" do
		list = List.new(:Address => "1234 Dayton Street",
							:Bedrooms => 4,
							:Zip => 12345,
							:Rent => "200")
		assert list.invalid?
	end
	
		
end