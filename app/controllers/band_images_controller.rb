class BandImagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :find_band
  before_filter :find_band_image, only: [:show, :set_main, :destroy]
  before_filter :find_band_participations
  before_filter :only_member, only: [:create, :destroy, :set_main]
  respond_to :html

  def index
    @band_images = @band.band_images.select { |image| image.persisted? }
    @nb_images = @band.band_images.count
    @band_image = @band.band_images.build if @participations.detect { |member| member.band_id == @band.id }
    respond_with @band_images
  end

  def show
    @previous = @band_image.previous
    @next = @band_image.next
    respond_with @band_image
  end

  def create
    @band_image = @band.band_images.build(params[:band_image])

    respond_to do |format|
      if @band_image.save
        format.html { redirect_to band_band_images_path(@band), notice: t('image_uploaded') }
      else
        format.html do
          @band_images = @band.band_images.select { |image| image.persisted? }
          @nb_images = @band.band_images.count
          render :action => "index"
        end
      end
    end
  end

  def set_main
    main_image = @band.main_image
    if @band_image.update_attribute(:is_main, true)
      main_image.update_attribute(:is_main, false) if main_image
    end
    redirect_to band_band_image_path(@band, @band_image), notice: t('image_is_main')
  end

  def destroy
    @band_image.destroy
    redirect_to band_band_images_path(@band), notice: t('image_deleted')
  end

  private
  def find_band
    begin
      @band = Band.find(params[:band_id])
    rescue
      redirect_to bands_url, alert: t('band_unknown')
    end
  end

  def find_band_image
    begin
      @band_image = @band.band_images.find(params[:id])
    rescue
      redirect_to band_band_images_path(@band), alert: t('image_unknown')
    end
  end

  def find_band_participations
    @participations = []
    @participations = current_user.band_participations if current_user
  end

  def only_member
    redirect_to bands_path, alert: t('page_unknown') unless current_user && @participations.detect { |member| member.band_id == @band.id }
  end

end
