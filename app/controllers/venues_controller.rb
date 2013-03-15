class VenuesController < ApplicationController
  before_filter :find_venue, only: [:show, :edit, :update, :destroy]
  respond_to :html

  # GET /venues
  def index
    if params[:search]
      search = Regexp.escape params[:search]
      @venues = Venue.all({:conditions => ["lower(name) LIKE ?", "%#{search.downcase}%"]})
    elsif params[:by_letter]
      @venues = Venue.by_letter(params[:by_letter].downcase)
    else
      @venues = Venue.limit(10)
    end
    respond_with @venues
  end

  # GET /venues/1
  def show
    nearby = @venue.nearbys(10)
    @nearby_venues = nearby.sort { |a,b| a.distance.to_f <=> b.distance.to_f } unless nearby.nil?

    @json1 = @venue.to_gmaps4rails do |venue, marker|
      marker.picture({
      :picture => '/images/icons/venue-red.png',
      :width   => 32,
      :height  => 40
      })
    end

    @json2= @venue.nearbys(10).to_gmaps4rails do |venue, marker|
      marker.picture({
      :picture => "/images/icons/venue-blue.png",
      :width   => 32,
      :height  => 40
      })
    end

    @json = (JSON.parse(@json1) + JSON.parse(@json2)).to_json

    respond_with @venue
  end

  # GET /venues/new
  def new
    @venue = Venue.new
    respond_with @venue
  end

  # GET /venues/1/edit
  def edit
  end

  # POST /venues
  def create
    @venue = Venue.new(params[:venue])

    if @venue.save
      redirect_to @venue, notice: t('venue_created')
    else
      render action: "new"
    end
  end

  # PUT /venues/1
  def update
    if @venue.update_attributes(params[:venue])
      redirect_to @venue, notice: t('venue_updated')
    else
      render action: "edit"
    end
  end

  # DELETE /venues/1
  def destroy
    @venue.destroy
    redirect_to venues_url
  end

  private
  def find_venue
    begin
      @venue = Venue.find(params[:id])
    rescue
      redirect_to venues_url, alert: t('venue_unknown')
    end
  end
end