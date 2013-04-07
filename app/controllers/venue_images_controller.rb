class VenueImagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :find_venue
  before_filter :find_managerships, except: [:show]
  before_filter :only_manager, only: [:create, :destroy]
  respond_to :html

  def index
    @venue_images = @venue.venue_images.select { |image| image.persisted? }
    @nb_images = @venue.venue_images.count
    @venue_image = @venue.venue_images.build if @managerships.detect { |manager| manager.venue_id == @venue.id }
    respond_with @venue_images
  end

  def show
    begin
      @venue_image = @venue.venue_images.find(params[:id])
      respond_with @venue_image
    rescue
      redirect_to venue_venue_images_path(@venue), alert: t('image_unknown')
    end
  end

  def create
    @venue_image = @venue.venue_images.build(params[:venue_image])

    respond_to do |format|
      if @venue_image.save
        format.html { redirect_to venue_venue_images_path(@venue), notice: t('image_uploaded') }
      else
        format.html { render :action => "index" }
      end
    end
  end

  def destroy
    
  end

  private
  def find_venue
    begin
      @venue = Venue.find(params[:venue_id])
    rescue
      redirect_to venues_url, alert: t('venue_unknown')
    end
  end

  def find_managerships
    @managerships = []
    @managerships = current_user.managerships if current_user
  end

  def only_manager
    redirect_to venues_path, alert: t('page_unknown') unless current_user && @managerships.detect { |manager| manager.venue_id == @venue.id }
  end

end
