class GigsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :poster]
  before_filter :find_gig, except: [:index, :new, :create]
  before_filter :find_managerships, :find_band_participations, except: [:index, :poster]
  before_filter :only_manager_or_member, only: [:edit, :update, :destroy, :remove_poster]
  before_filter :only_venue_manager_or_band_member, only: [:new, :create]
  respond_to :html

  # GET /gigs
  def index
    if params[:search]
      search = Regexp.escape params[:search]
      @gigs = Gig.upcoming.by_search(search.downcase).includes([{:main_act => :band}, :venue])
    elsif params[:by_letter]
      @gigs = Gig.upcoming.by_letter(params[:by_letter].downcase).includes([{:main_act => :band}, :venue])
    else
      @gigs = Gig.upcoming.includes([{:main_act => :band}, :venue]).limit(10)
    end
    respond_with @gigs
  end

  # GET /gigs/1
  def show
    @main_act = @gig.main_act
    @supporting_acts = @gig.supporting_acts.includes(:band)
    unless @gig.venue.blank?
      gmap_selected_venue = @gig.venue.to_gmaps4rails do |venue, marker|
        marker.picture({
        :picture => '/images/icons/venue-red.png',
        :width   => 32,
        :height  => 40
        })
      end
      @gmap_venue = JSON.parse(gmap_selected_venue).to_json
    end
    respond_with @gig
  end

  # GET /gigs/new
  def new
    @my_venue ||= params[:venue_id]
    @my_band ||= params[:band_id]
    @gig = Gig.new(venue_id: @my_venue)
    initialize_bands_and_venues_for_form
    initialize_acts
    respond_with @gig
  end

  # GET /gigs/1/edit
  def edit
    initialize_bands_and_venues_for_form
    initialize_acts
  end

  # POST /gigs
  def create
    @gig = Gig.new(params[:gig]) do |gig|
      gig.user_gold = current_user
    end

    if @gig.save
      redirect_to @gig, notice: t('gig_created')
    else
      initialize_bands_and_venues_for_form
      initialize_acts
      render action: "new"
    end
  end

  # PUT /gigs/1
  def update
    @gig.user_gold = current_user
    if @gig.update_attributes(params[:gig])
      redirect_to @gig, notice: t('gig_updated')
    else
      initialize_bands_and_venues_for_form
      initialize_acts
      render action: "edit"
    end
  end

  # DELETE /gigs/1
  def destroy
    @gig.destroy
    redirect_to gigs_url
  end

  # GET /gigs/1/poster
  def poster
    unless @gig.poster?
      redirect_to @gig, alert: t('gig_poster_unknown')
    end
  end

  # PUT /gigs/1/remove_poster
  def remove_poster
    store_dir = @gig.poster.store_dir
    @gig.remove_poster!
    FileUtils.remove_dir("#{Rails.root}/public/#{store_dir}", :force => true)

    redirect_to @gig, notice: t('gig_poster_deleted')
  end

  private
  def find_gig
    begin
      @gig = Gig.find(params[:id])
    rescue
      redirect_to gigs_url, alert: t('gig_unknown')
    end
  end

  def initialize_bands_and_venues_for_form
    if current_user.is_venue_manager?
      @venues = @managerships.map(&:venue)
      if @my_venue && @venue = @venues.detect { |venue| venue.id == @my_venue.to_i }
        @venues = [@venue]
      end
      @bands = Band.all
    elsif current_user.is_band_member?
      @bands = @band_participations.map(&:band)
      if @my_band && @band = @bands.detect { |band| band.id == @my_band.to_i }
        @bands = [@band]
      end
      @venues = Venue.all
    end
  end

  def initialize_acts
    @main_act = (@gig.main_act || @gig.build_main_act(:band_id => @my_band))
    @supporting_acts = @gig.supporting_acts
    (4-@supporting_acts.size).times { @gig.supporting_acts.build }
  end

  def find_managerships
    @managerships = []
    @managerships = current_user.managerships if current_user
  end

  def find_band_participations
    @band_participations = []
    @band_participations = current_user.band_participations if current_user
  end

  def only_manager_or_member
    unless @gig.venue.in_managerships?(@managerships) ||  (@gig.main_act &&  @gig.main_act.band.in_band_participations?(@band_participations))
      redirect_to gig_path(@gig), alert: t('page_unknown')
    end
  end

  def only_venue_manager_or_band_member
    redirect_to gigs_path, alert: t('page_unknown') unless current_user.is_venue_manager? || current_user.is_band_member?
  end
end
