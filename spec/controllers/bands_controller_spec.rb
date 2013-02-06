require 'spec_helper'

describe BandsController do

  # This should return the minimal set of attributes required to create a valid
  # Band. As you add validations to Band, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "Band", "creation_year" => 2008 }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BandsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before(:each) do
    @band = FactoryGirl.create(:band, :name => "Erase")
  end

  describe "GET index" do

    before(:each) do
      @band_2 = FactoryGirl.create(:band, :name => "Bibi")
      @band_3 = FactoryGirl.create(:band, :name => "Dada")
      @band_4 = FactoryGirl.create(:band, :name => "Bobo")
    end
    it "assigns all bands as @bands" do
      get :index, {}, valid_session
      assigns(:bands).size.should eq 4

      assigns(:bands).should include @band
      assigns(:bands).should include @band_2
      assigns(:bands).should include @band_3
      assigns(:bands).should include @band_4

      response.should be_success
      response.should render_template "index"
    end

    it "assigns bands by first letter" do
      get :index, {:by_letter => "B"}, valid_session
      assigns(:bands).size.should eq 2
      assigns(:bands).should include @band_2
      assigns(:bands).should include @band_4
      response.should be_success

      get :index, {:by_letter => "D"}, valid_session
      assigns(:bands).size.should eq 1
      assigns(:bands).should include @band_3
      response.should be_success
    end

    it "assigns bands with search" do
      get :index, {:search => "bob"}, valid_session
      assigns(:bands).size.should eq 1
      assigns(:bands).should include @band_4
      response.should be_success

      get :index, {:search => "blabla"}, valid_session
      assigns(:bands).should be_empty
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested band as @band" do
      get :show, {:id => @band.to_param}, valid_session
      assigns(:band).should eq @band
      response.should be_success
      response.should render_template "show"
    end

    it "redirecto to index when ID unknown" do
      @band.destroy
      get :show, {:id => @band.to_param}, valid_session
      response.should redirect_to bands_url
    end
  end

  describe "GET new" do
    it "assigns a new band as @band" do
      get :new, {}, valid_session
      assigns(:band).should be_a_new Band
      response.should be_success
      response.should render_template "new"
    end
  end

  describe "GET edit" do
    it "assigns the requested band as @band" do
      band = FactoryGirl.create(:band)
      get :edit, {:id => @band.to_param}, valid_session
      assigns(:band).should eq @band
      response.should be_success
      response.should render_template "edit"
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Band" do
        expect {
          post :create, {:band => valid_attributes}, valid_session
        }.to change(Band, :count).by 1
      end

      it "assigns a newly created band as @band" do
        post :create, {:band => valid_attributes}, valid_session
        assigns(:band).should be_a Band
        assigns(:band).should be_persisted
      end

      it "redirects to the created band" do
        post :create, {:band => valid_attributes}, valid_session
        response.should redirect_to Band.unscoped.last
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved band as @band" do
        # Trigger the behavior that occurs when invalid params are submitted
        Band.any_instance.stub(:save).and_return(false)
        post :create, {:band => { "name" => "" }}, valid_session
        assigns(:band).should be_a_new Band
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Band.any_instance.stub(:save).and_return(false)
        post :create, {:band => { "name" => "" }}, valid_session
        response.should render_template "new"
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested band" do
        # Assuming there are no other bands in the database, this
        # specifies that the Band created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Band.any_instance.should_receive(:update_attributes).with({ "name" => "Bandddd" })
        put :update, {:id => @band.to_param, :band => { "name" => "Bandddd" }}, valid_session
      end

      it "assigns the requested band as @band" do
        put :update, {:id => @band.to_param, :band => valid_attributes}, valid_session
        assigns(:band).should eq @band
      end

      it "redirects to the band" do
        put :update, {:id => @band.to_param, :band => valid_attributes}, valid_session
        response.should redirect_to @band
      end
    end

    describe "with invalid params" do
      it "assigns the band as @band" do
        # Trigger the behavior that occurs when invalid params are submitted
        Band.any_instance.stub(:save).and_return(false)
        put :update, {:id => @band.to_param, :band => { "name" => "" }}, valid_session
        assigns(:band).should eq @band
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Band.any_instance.stub(:save).and_return(false)
        put :update, {:id => @band.to_param, :band => { "name" => "" }}, valid_session
        response.should render_template "edit"
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested band" do
      expect {
        delete :destroy, {:id => @band.to_param}, valid_session
      }.to change(Band, :count).by -1
    end

    it "redirects to the bands list" do
      delete :destroy, {:id => @band.to_param}, valid_session
      response.should redirect_to bands_url
    end
  end

end
