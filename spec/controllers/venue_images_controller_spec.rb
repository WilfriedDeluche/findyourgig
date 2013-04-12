require 'spec_helper'

describe VenueImagesController do

  def valid_attributes
    {:remote_file_url => "http://www.bataclan.fr/bataclan_home_fr_uk.png"}
  end

  before(:each) do
    @venue = FactoryGirl.build(:venue) { |venue| venue.skip_geocoding = true }
    @venue.save

    @user = FactoryGirl.create(:user, :email => "manager@venue1.com", :role => "venue_manager")
    @user_2 = FactoryGirl.create(:user, :email => "admin@admin.com", :role => "venue_manager")

    @management = FactoryGirl.create(:managership, :user => @user, :venue => @venue)

    @venue_image = FactoryGirl.build(:venue_image, :venue => @venue, :is_main => true)
    @venue_image.file = upload_file_for(@venue_image)
    @venue_image.save
  end

  after :each do
    @venue.destroy
  end

  def upload_file_for(object)
    uploader = VenueImageUploader.new(object, :file)
    uploader.store!(File.new(Rails.root + 'spec/fixtures/files/no-image.png', "r"))
    uploader
  end

  describe "with several images uploaded" do

    before(:each) do
      @venue_image_2 = FactoryGirl.build(:venue_image, :venue => @venue)
      @venue_image_2.file = upload_file_for(@venue_image_2)
      @venue_image_2.save

      @venue_image_3 = FactoryGirl.build(:venue_image, :venue => @venue)
      @venue_image_3.file = upload_file_for(@venue_image_3)
      @venue_image_3.save
    end

    describe "GET index" do

      it "assigns all venues as @venue_images and assigns size as @nb_images" do
        get :index, {:venue_id => @venue.id}

        assigns(:venue_images).should include @venue_image
        assigns(:venue_images).should include @venue_image_2
        assigns(:venue_images).should include @venue_image_3

        assigns(:nb_images).should eq 3

        response.should be_success
        response.should render_template "index"
      end

      it "should build a new VenueImage if Manager signed in" do
        sign_in @user
        get :index, {:venue_id => @venue.id}
        assigns(:venue_image).should_not be_persisted
      end

      it "should NOT build a new VenueImage if Manager NOT signed in" do
        sign_in @user_2
        get :index, {:venue_id => @venue.id}
        assigns(:venue_image).should be_nil
      end
    end

    describe "GET show" do

      it "assigns the requested venue as @venue_image" do
        get :show, {:venue_id => @venue.id, :id => @venue_image.to_param}
        assigns(:venue_image).should eq @venue_image
        response.should be_success
        response.should render_template "show"
      end

      it "should assigns previous and next venue_images if they exist" do
        get :show, {:venue_id => @venue.id, :id => @venue_image_2.to_param}
        assigns(:previous).should eq @venue_image_3
        assigns(:next).should eq @venue_image
      end
    end

    describe "PUT set_main @venue_image" do

      it "should set is_main attribute to TRUE and redirect to show page with notice message" do
        sign_in @user
        put :set_main, {:venue_id => @venue.id, :id => @venue_image_2.to_param}
        assigns(:venue_image).should eq @venue_image_2
        assigns(:venue_image).is_main.should eq true

        response.should redirect_to [@venue, @venue_image_2]
        flash[:notice].should_not be_nil
      end

      it "should set previous main venue_image's is_main attribute to FALSE" do
        @venue_image.is_main.should eq true
        sign_in @user
        put :set_main, {:venue_id => @venue.id, :id => @venue_image_2.to_param}
        @venue_image.reload.is_main.should eq false
      end
    end
  end

  describe "POST create" do
    it "should not be accessible when user not venue_manager" do
      sign_in @user_2
      post :create, {:venue_id => @venue.id, :venue_image => valid_attributes}
      response.should redirect_to venues_path
      flash[:alert].should_not be_nil
    end

    before(:each) { sign_in @user }

    describe "with valid params" do
      it "creates a new VenueImage" do
        expect {
          post :create, {:venue_id => @venue.id, :venue_image => valid_attributes}
        }.to change(VenueImage, :count).by(1)
      end

      it "assigns a newly created venue image as @venue_image" do
        post :create, {:venue_id => @venue.id, :venue_image => valid_attributes}
        assigns(:venue_image).should be_a(VenueImage)
        assigns(:venue_image).should be_persisted
      end

      it "redirects to @venue" do
        post :create, {:venue_id => @venue.id, :venue_image => valid_attributes}
        response.should redirect_to venue_venue_images_path(@venue)
        flash[:notice].should_not be_nil
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved venue image as @venue_image" do
        # Trigger the behavior that occurs when invalid params are submitted
        VenueImage.any_instance.stub(:save).and_return(false)
        post :create, {:venue_id => @venue.id, :venue_image => {:remote_file_url => nil, :file => nil}}
        assigns(:venue_image).should be_a_new(VenueImage)
      end

      it "re-renders the 'index' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        VenueImage.any_instance.stub(:save).and_return(false)
        post :create, {:venue_id => @venue.id, :venue_image => {:remote_file_url => nil, :file => nil}}
        response.should render_template("index")
        assigns(:venue_images).should include @venue_image
        assigns(:nb_images).should eq 1
      end
    end
  end

  describe "DELETE destroy" do

    it "destroys the requested venue_image if current_user owns band_participation" do
      sign_in @user
      expect {
        delete :destroy, {:venue_id => @venue.id, :id => @venue_image.to_param}
      }.to change(VenueImage, :count).by -1
    end

    it "redirects to the venue images list and flashes notice" do
      sign_in @user
      delete :destroy, {:venue_id => @venue.id, :id => @venue_image.to_param}
      response.should redirect_to venue_venue_images_path
      flash[:notice].should_not be_nil
    end

    it "does NOT destroy the requested venue_image if current_user is not manager" do
      sign_in @user_2
      expect {
        delete :destroy, {:venue_id => @venue.id, :id => @venue_image.to_param}
        response.should redirect_to venues_path
        flash[:alert].should_not be_nil
      }.to change(VenueImage, :count).by 0
    end
  end

  describe "Pages Only ACCESSIBLE to Managers" do
    it "should not be accessible when user not manager of the selected venue" do
      sign_in @user_2

      [:set_main, :destroy].each do |action|
        if action == :set_main
          put action, {:venue_id => @venue.id, :id => @venue_image.to_param}
        elsif action == :destroy
          delete action, {:venue_id => @venue.id, :id => @venue_image.to_param}
        end
        response.should redirect_to venues_path
        flash[:alert].should_not be_nil
      end
    end
  end

  describe "Objects not found" do
    it "redirect venue images page when image not found" do
      @venue_image.destroy
      get :show, {:venue_id => @venue.id, :id => @venue_image.to_param}
      response.should redirect_to venue_venue_images_path(@venue)
      flash[:alert].should_not be_nil
    end

    it "redirect venues page when venue not found" do
      @venue.destroy
      get :show, {:venue_id => @venue.id, :id => @venue_image.to_param}
      response.should redirect_to venues_url
      flash[:alert].should_not be_nil
    end
  end
end
