require 'spec_helper'

describe BandImagesController do

  def valid_attributes
    {:remote_file_url => "http://trashlounge.co.uk/wp-content/uploads/2012/01/JLS-Booth.jpg"}
  end

  before(:each) do
    @band = FactoryGirl.create(:band)

    @user = FactoryGirl.create(:user, :email => "member@band1.com", :role => "band_member")
    @user_2 = FactoryGirl.create(:user, :email => "admin@admin.com", :role => "band_member")

    @participation = FactoryGirl.create(:band_participation, :user => @user, :band => @band)

    @band_image = FactoryGirl.build(:band_image, :band => @band, :is_main => true)
    @band_image.file = upload_file_for(@band_image)
    @band_image.save
  end

  after :each do
    @band.destroy
  end

  def upload_file_for(object)
    uploader = BandImageUploader.new(object, :file)
    uploader.store!(File.new(Rails.root + 'spec/fixtures/files/no-image.png', "r"))
    uploader
  end

  describe "with several images uploaded" do

    before(:each) do
      @band_image_2 = FactoryGirl.build(:band_image, :band => @band)
      @band_image_2.file = upload_file_for(@band_image_2)
      @band_image_2.save

      @band_image_3 = FactoryGirl.build(:band_image, :band => @band)
      @band_image_3.file = upload_file_for(@band_image_3)
      @band_image_3.save
    end

    describe "GET index" do

      it "assigns all bands as @band_images and assigns size as @nb_images" do
        get :index, {:band_id => @band.id}

        assigns(:band_images).should include @band_image
        assigns(:band_images).should include @band_image_2
        assigns(:band_images).should include @band_image_3

        assigns(:nb_images).should eq 3

        response.should be_success
        response.should render_template "index"
      end

      it "should build a new BandImage if Manager signed in" do
        sign_in @user
        get :index, {:band_id => @band.id}
        assigns(:band_image).should_not be_persisted
      end

      it "should NOT build a new BandImage if Manager NOT signed in" do
        sign_in @user_2
        get :index, {:band_id => @band.id}
        assigns(:band_image).should be_nil
      end
    end

    describe "GET show" do

      it "assigns the requested band as @band_image" do
        get :show, {:band_id => @band.id, :id => @band_image.to_param}
        assigns(:band_image).should eq @band_image
        response.should be_success
        response.should render_template "show"
      end

      it "should assigns previous and next band_images if they exist" do
        get :show, {:band_id => @band.id, :id => @band_image_2.to_param}
        assigns(:previous).should eq @band_image_3
        assigns(:next).should eq @band_image
      end
    end

    describe "PUT set_main @band_image" do

      it "should set is_main attribute to TRUE and redirect to show page with notice message" do
        sign_in @user
        put :set_main, {:band_id => @band.id, :id => @band_image_2.to_param}
        assigns(:band_image).should eq @band_image_2
        assigns(:band_image).is_main.should eq true

        response.should redirect_to [@band, @band_image_2]
        flash[:notice].should_not be_nil
      end

      it "should set previous main band_image's is_main attribute to FALSE" do
        @band_image.is_main.should eq true
        sign_in @user
        put :set_main, {:band_id => @band.id, :id => @band_image_2.to_param}
        @band_image.reload.is_main.should eq false
      end
    end
  end

  describe "POST create" do
    it "should not be accessible when user not band_manager" do
      sign_in @user_2
      post :create, {:band_id => @band.id, :band_image => valid_attributes}
      response.should redirect_to bands_path
      flash[:alert].should_not be_nil
    end

    before(:each) { sign_in @user }

    describe "with valid params" do
      it "creates a new BandImage" do
        expect {
          post :create, {:band_id => @band.id, :band_image => valid_attributes}
        }.to change(BandImage, :count).by(1)
      end

      it "assigns a newly created band image as @band_image" do
        post :create, {:band_id => @band.id, :band_image => valid_attributes}
        assigns(:band_image).should be_a(BandImage)
        assigns(:band_image).should be_persisted
      end

      it "redirects to @band" do
        post :create, {:band_id => @band.id, :band_image => valid_attributes}
        response.should redirect_to band_band_images_path(@band)
        flash[:notice].should_not be_nil
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved band image as @band_image" do
        # Trigger the behavior that occurs when invalid params are submitted
        BandImage.any_instance.stub(:save).and_return(false)
        post :create, {:band_id => @band.id, :band_image => {:remote_file_url => nil, :file => nil}}
        assigns(:band_image).should be_a_new(BandImage)
      end

      it "re-renders the 'index' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BandImage.any_instance.stub(:save).and_return(false)
        post :create, {:band_id => @band.id, :band_image => {:remote_file_url => nil, :file => nil}}
        response.should render_template("index")
        assigns(:band_images).should include @band_image
        assigns(:nb_images).should eq 1
      end
    end
  end

  describe "DELETE destroy" do

    it "destroys the requested band_image if current_user owns band_participation" do
      sign_in @user
      expect {
        delete :destroy, {:band_id => @band.id, :id => @band_image.to_param}
      }.to change(BandImage, :count).by -1
    end

    it "redirects to the band images list and flashes notice" do
      sign_in @user
      delete :destroy, {:band_id => @band.id, :id => @band_image.to_param}
      response.should redirect_to band_band_images_path
      flash[:notice].should_not be_nil
    end

    it "does NOT destroy the requested band_image if current_user is not manager" do
      sign_in @user_2
      expect {
        delete :destroy, {:band_id => @band.id, :id => @band_image.to_param}
        response.should redirect_to bands_path
        flash[:alert].should_not be_nil
      }.to change(BandImage, :count).by 0
    end
  end

  describe "Pages Only ACCESSIBLE to Members" do
    it "should not be accessible when user not member of the selected band" do
      sign_in @user_2

      [:set_main, :destroy].each do |action|
        if action == :set_main
          put action, {:band_id => @band.id, :id => @band_image.to_param}
        elsif action == :destroy
          delete action, {:band_id => @band.id, :id => @band_image.to_param}
        end
        response.should redirect_to bands_path
        flash[:alert].should_not be_nil
      end
    end
  end

  describe "Objects not found" do
    it "redirect band images page when image not found" do
      @band_image.destroy
      get :show, {:band_id => @band.id, :id => @band_image.to_param}
      response.should redirect_to band_band_images_path(@band)
      flash[:alert].should_not be_nil
    end

    it "redirect bands page when band not found" do
      @band.destroy
      get :show, {:band_id => @band.id, :id => @band_image.to_param}
      response.should redirect_to bands_url
      flash[:alert].should_not be_nil
    end
  end
end
