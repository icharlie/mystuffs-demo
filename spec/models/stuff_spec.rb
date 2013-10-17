require 'spec_helper'

describe Stuff do
	after(:all) do
		User.delete_all
		Stuff.delete_all
	end

	it "should belong to a user" do
	  stuff = create(:stuff)
	  stuff.should respond_to(:user)
	end

  it "should have an asset" do
    stuff = create(:stuff)
    stuff.assets.size.should_not == 0
  end

  it "should belong to a user" do
  	stuff = create(:stuff)
  	stuff.user_id.should_not be(nil)
  end

end
