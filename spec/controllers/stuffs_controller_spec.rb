require 'spec_helper'

describe StuffsController do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  let(:valid_attributes) { FactoryGirl.build(:stuff).attributes }

  after(:each) do
    User.delete_all
    Stuff.delete_all
  end
  before (:each) do
    @user = create(:user)
    sign_in @user
  end

  describe "GET index" do
    it "assigns all stuffs as @stuffs" do
      stuffs = Stuff.all
      get :index, {}
      assigns(:stuffs).should eq(stuffs)
    end
  end

  describe "GET show" do
    it "assigns the requested stuff as @stuff" do
      stuff = @user.stuffs.create! valid_attributes
      get :show, {id: stuff.to_param, user: @user.to_param}
      assigns(:stuff).should eq(stuff)
    end
  end

  describe "GET new" do
    it "assigns a new stuff as @stuff" do
      stuff = @user.stuffs.create! valid_attributes
      get :new, {}
      assigns(:stuff).should be_a_new(Stuff)
    end
  end

  describe "GET edit" do
    it "assigns the requested stuff as @stuff" do
      stuff = @user.stuffs.create! valid_attributes
      Stuff.stub(:find).and_return(stuff)
      get :edit, {id: stuff.to_param, user: @user.to_param}
      assigns(:stuff).should eq(stuff)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Stuff" do
        expect {
          post :create, {:stuff => valid_attributes }
        }.to change(Stuff, :count).by(1)
      end

      it "assigns a newly created stuff as @stuff" do
        post :create, {:stuff => valid_attributes}
        assigns(:stuff).should be_a(Stuff)
        assigns(:stuff).should be_persisted
      end

      it "redirects to the created stuff" do
        post :create, {:stuff => valid_attributes}
        response.should redirect_to(Stuff.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved stuff as @stuff" do
        # Trigger the behavior that occurs when invalid params are submitted
        Stuff.any_instance.stub(:save).and_return(false)
        post :create, {:stuff => {  }}
        assigns(:stuff).should be_a_new(Stuff)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Stuff.any_instance.stub(:save).and_return(false)
        post :create, {:stuff => {  }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested stuff" do
        stuff = @user.stuffs.create valid_attributes
        Stuff.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => stuff.to_param, :stuff => { "these" => "params" }}
      end

      it "assigns the requested stuff as @stuff" do
        stuff = @user.stuffs.create valid_attributes
        Stuff.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => stuff.to_param, :stuff => { "these" => "params" }}
        assigns(:stuff).should eq(stuff)
      end

      it "redirects to the stuff" do
        stuff = @user.stuffs.create valid_attributes
        Stuff.any_instance.should_receive(:update_attributes).with({ "these" => "params" }).and_return(true)
        put :update, {:id => stuff.to_param, :stuff => { "these" => "params" }}
        response.should redirect_to(stuff)
      end
    end

    describe "with invalid params" do
      it "assigns the stuff as @stuff" do
        stuff = @user.stuffs.create valid_attributes
        Stuff.any_instance.stub(:save).and_return(false)
        put :update, {:id => stuff.to_param, :stuff => {  }}
        assigns(:stuff).should eq(stuff)
      end

      it "re-renders the 'edit' template" do
        stuff = @user.stuffs.create valid_attributes
        Stuff.any_instance.stub(:save).and_return(false)
        put :update, {:id => stuff.to_param, :stuff => {  }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested stuff" do
      stuff = @user.stuffs.create valid_attributes
      expect {
        delete :destroy, {:id => stuff.to_param}
      }.to change(Stuff, :count).by(-1)
    end

    it "redirects to the stuffs list" do
      stuff = @user.stuffs.create valid_attributes
      delete :destroy, {:id => stuff.to_param}
      response.should redirect_to(stuffs_url)
    end
  end

end
