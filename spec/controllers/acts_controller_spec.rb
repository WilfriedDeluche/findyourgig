require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ActsController do

  # This should return the minimal set of attributes required to create a valid
  # Act. As you add validations to Act, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "gig_id" => "1" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ActsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all acts as @acts" do
      act = Act.create! valid_attributes
      get :index, {}, valid_session
      assigns(:acts).should eq([act])
    end
  end

  describe "GET show" do
    it "assigns the requested act as @act" do
      act = Act.create! valid_attributes
      get :show, {:id => act.to_param}, valid_session
      assigns(:act).should eq(act)
    end
  end

  describe "GET new" do
    it "assigns a new act as @act" do
      get :new, {}, valid_session
      assigns(:act).should be_a_new(Act)
    end
  end

  describe "GET edit" do
    it "assigns the requested act as @act" do
      act = Act.create! valid_attributes
      get :edit, {:id => act.to_param}, valid_session
      assigns(:act).should eq(act)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Act" do
        expect {
          post :create, {:act => valid_attributes}, valid_session
        }.to change(Act, :count).by(1)
      end

      it "assigns a newly created act as @act" do
        post :create, {:act => valid_attributes}, valid_session
        assigns(:act).should be_a(Act)
        assigns(:act).should be_persisted
      end

      it "redirects to the created act" do
        post :create, {:act => valid_attributes}, valid_session
        response.should redirect_to(Act.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved act as @act" do
        # Trigger the behavior that occurs when invalid params are submitted
        Act.any_instance.stub(:save).and_return(false)
        post :create, {:act => { "gig_id" => "invalid value" }}, valid_session
        assigns(:act).should be_a_new(Act)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Act.any_instance.stub(:save).and_return(false)
        post :create, {:act => { "gig_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested act" do
        act = Act.create! valid_attributes
        # Assuming there are no other acts in the database, this
        # specifies that the Act created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Act.any_instance.should_receive(:update_attributes).with({ "gig_id" => "1" })
        put :update, {:id => act.to_param, :act => { "gig_id" => "1" }}, valid_session
      end

      it "assigns the requested act as @act" do
        act = Act.create! valid_attributes
        put :update, {:id => act.to_param, :act => valid_attributes}, valid_session
        assigns(:act).should eq(act)
      end

      it "redirects to the act" do
        act = Act.create! valid_attributes
        put :update, {:id => act.to_param, :act => valid_attributes}, valid_session
        response.should redirect_to(act)
      end
    end

    describe "with invalid params" do
      it "assigns the act as @act" do
        act = Act.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Act.any_instance.stub(:save).and_return(false)
        put :update, {:id => act.to_param, :act => { "gig_id" => "invalid value" }}, valid_session
        assigns(:act).should eq(act)
      end

      it "re-renders the 'edit' template" do
        act = Act.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Act.any_instance.stub(:save).and_return(false)
        put :update, {:id => act.to_param, :act => { "gig_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested act" do
      act = Act.create! valid_attributes
      expect {
        delete :destroy, {:id => act.to_param}, valid_session
      }.to change(Act, :count).by(-1)
    end

    it "redirects to the acts list" do
      act = Act.create! valid_attributes
      delete :destroy, {:id => act.to_param}, valid_session
      response.should redirect_to(acts_url)
    end
  end

end
