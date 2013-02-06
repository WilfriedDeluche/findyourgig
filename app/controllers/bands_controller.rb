class BandsController < ApplicationController
  before_filter :find_band, only: [:show, :edit, :update, :destroy]
  before_filter :user_must_be_band_member, only: [:my_bands]
  respond_to :html

  def index
    if params[:search]
      search = Regexp.escape params[:search]
      @bands = Band.all({:conditions => ["lower(name) LIKE ?", "%#{search.downcase}%"]})
    elsif params[:by_letter]
      @bands = Band.by_letter(params[:by_letter].downcase)
    else
      @bands = Band.limit(10)
    end
    respond_with @bands
  end

  def my_bands
    @participations = current_user.band_participations
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

  def user_must_be_band_member
    redirect_to root_path, alert: t('page_unknown') unless current_user.roles_list.include? User::BAND_MEMBER
  end
end
