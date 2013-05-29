class VenuesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :find_venue, only: [:show, :edit, :update, :destroy]
  before_filter :find_managerships, except: [:new, :create]
  before_filter :only_manager, only: [:edit, :update, :destroy]
  before_filter :only_venue_manager, only: [:new, :create]
  respond_to :html

  def index
    if params[:search]
      search = Regexp.escape params[:search]
      @venues = Venue.all({:conditions => ["lower(name) LIKE ?", "%#{search.downcase}%"], include: :main_image})
    elsif params[:by_letter]
      @venues = Venue.includes(:main_image).by_letter(params[:by_letter].downcase)
    else
      @venues = Venue.includes(:main_image).limit(10)
    end
    respond_with @venues
  end

  def show
    nearby = @venue.nearbys(10)
    @nearby_venues = nearby.nil? ? [] : nearby.sort { |a,b| a.distance.to_f <=> b.distance.to_f }

    gmap_selected_venue = @venue.to_gmaps4rails do |venue, marker|
      marker.picture({
      :picture => '/images/icons/venue-red.png',
      :width   => 32,
      :height  => 40
      })
    end

    gmap_nearby_venues = "[]"
    unless nearby.nil?
      gmap_nearby_venues = nearby.to_gmaps4rails do |venue, marker|
        marker.picture({
        :picture => "/images/icons/venue-blue.png",
        :width   => 32,
        :height  => 40
        })
      end
    end

    @gmap_full_venues = (JSON.parse(gmap_selected_venue) + JSON.parse(gmap_nearby_venues)).to_json
    
    @nb_images = @venue.venue_images.count
    @venue_images = @venue.venue_images.limit(5)
    
    @feedbacks = @venue.feedbacks.includes(:feedback_comments)
    @feedback = Feedback.new

    respond_with @venue
  end

  def new
    @venue = Venue.new
    respond_with @venue
  end

  def edit
  end

  def create
    @venue = Venue.new(params[:venue])

    if @venue.save
      @venue.managerships.create(user_id: current_user.id, is_admin: true)
      redirect_to @venue, notice: t('venue_created')
    else
      render action: "new"
    end
  end

  def update
    if @venue.update_attributes(params[:venue])
      redirect_to @venue, notice: t('venue_updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @venue.destroy
    redirect_to managerships_url
  end

  private
  def find_venue
    begin
      @venue = Venue.find(params[:id])
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

  def only_venue_manager
    redirect_to venues_path, alert: t('page_unknown') unless current_user.roles_list.include?(User::VENUE_MANAGER)
  end
end