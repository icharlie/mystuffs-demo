require 'spec_helper'

describe "stuffs/new" do
  before(:each) do
    assign(:stuff, stub_model(Stuff).as_new_record)
  end

  it "renders new stuff form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stuffs_path, "post" do
    end
  end
end
