class VenueImagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :find_venue
  before_filter :find_venue_image, only: [:show, :set_main, :destroy]
  before_filter :find_managerships
  before_filter :only_manager, only: [:create, :destroy]
  respond_to :html

  def index
    @venue_images = @venue.venue_images.select { |image| image.persisted? }
    @nb_images = @venue.venue_images.count
    @venue_image = @venue.venue_images.build if @managerships.detect { |manager| manager.venue_id == @venue.id }
    respond_with @venue_images
  end

  def show
    @previous = @venue_image.previous
    @next = @venue_image.next
    respond_with @venue_image
  end

  def create
    @venue_image = @venue.venue_images.build(params[:venue_image])

    respond_to do |format|
      if @venue_image.save
        format.html { redirect_to venue_venue_images_path(@venue), notice: t('image_uploaded') }
      else
        format.html do
          @venue_images = @venue.venue_images.select { |image| image.persisted? }
          @nb_images = @venue.venue_images.count
          render :action => "index"
        end
      end
    end
  end

  def set_main
    @main_image = @venue.venue_images.where(is_main: true).first
    if @venue_image.update_attribute(:is_main, true)
      @main_image.update_attribute(:is_main, false) if @main_image
    end
    redirect_to venue_venue_image_path(@venue, @venue_image), notice: t('image_is_main')
  end

  def destroy
    @venue_image.remove_file!
    @venue_image.destroy
    redirect_to venue_venue_images_path(@venue), notice: t('image_deleted')
  end

  private
  def find_venue
    begin
      @venue = Venue.find(params[:venue_id])
    rescue
      redirect_to venues_url, alert: t('venue_unknown')
    end
  end

  def find_venue_image
    begin
      @venue_image = @venue.venue_images.find(params[:id])
    rescue
      redirect_to venue_venue_images_path(@venue), alert: t('image_unknown')
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
