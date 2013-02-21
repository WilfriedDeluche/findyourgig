class BandsController < ApplicationController
  before_filter :find_band, only: [:show, :edit, :update, :destroy, :request_participation, :members]
  before_filter :find_user_bands, only: [:index, :show, :request_participation, :edit, :update, :destroy, :members]
  before_filter :only_member_admin, only: [:edit, :update, :destroy, :members]
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

  def show
    flash.now[:info] = t('band_participation_request_pending') if @user_bands.detect { |part| part[:band_id] == @band.id && part[:active] == false }
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

  def request_participation
    unless @user_bands.collect { |part| part[:band_id] }.include? @band.id
      @participation = current_user.band_participations.build band_id: @band.id, is_admin: false, date_joined: Date.today
      if @participation.save
        redirect_to @band, notice: t('band_participation_request_sent')
      else
        redirect_to @band, alert: t('band_participation_request_could_not_be_sent')
      end
    else
      redirect_to band_participations_path, alert: t('already_participates')
    end
  end

  def members
    @members = @band.band_participations.order("date_joined ASC")
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

  def find_user_bands
    @user_bands = []
    @user_bands = current_user.band_participations.collect { |p| { band_id: p.band_id, admin: p.is_admin, active: !p.pending } } if current_user
  end

  def only_member_admin
    unless user_signed_in? && @user_bands.detect { |part| part[:band_id] == @band.id && part[:admin] == true }
      redirect_to bands_path, alert: t('page_unknown')
    end
  end
end
