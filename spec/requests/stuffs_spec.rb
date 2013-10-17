require 'spec_helper'

describe "Stuffs" do
  describe "GET /stuffs" do
    it "should redirect to login page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
			# request.env['warden'].stub :authenticate! => user
      get stuffs_path
      response.status.should redirect_to(new_user_session_path)
    end

    it "get all stuffs" do
    	sign_in
    	get stuffs_path
      expect(response.status).to eq(200)
    end
  end
end
