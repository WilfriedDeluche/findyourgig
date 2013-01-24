class BandsController < ApplicationController
  before_filter :find_band, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    if params[:search]
    elsif params[:by_letter]
      @bands = Band.by_letter(params[:by_letter])
    else
      @bands = Band.limit(10)
    end

    respond_with @bands
  end

  def show
    respond_with @band
  end

  def new
    @band = Band.new
    respond_with @band
  end

  def edit
  end

  def create
    @band = Band.new(params[:band])

    if @band.save
      redirect_to @band, notice: t('band_created')
    else
      render action: "new"
    end
  end

  def update
    if @band.update_attributes(params[:band])
      redirect_to @band, notice: t('band_updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @band.destroy
    redirect_to bands_url
  end

  private
  def find_band
    begin
      @band = Band.find(params[:id])
    rescue
      redirect_to bands_url, alert: t('band_unknown')
    end
  end
end
