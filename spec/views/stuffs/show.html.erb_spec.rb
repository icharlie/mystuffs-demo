require 'spec_helper'

describe "stuffs/show" do
  before(:each) do
    @stuff = assign(:stuff, stub_model(Stuff))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
