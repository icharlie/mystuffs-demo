require 'spec_helper'

describe "stuffs/index" do
  before(:each) do
    assign(:stuffs, [
      stub_model(Stuff),
      stub_model(Stuff)
    ])
  end

  it "renders a list of stuffs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
