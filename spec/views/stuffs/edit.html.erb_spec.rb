require 'spec_helper'

describe "stuffs/edit" do
  before(:each) do
    @stuff = assign(:stuff, stub_model(Stuff))
  end

  it "renders the edit stuff form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stuff_path(@stuff), "post" do
    end
  end
end
