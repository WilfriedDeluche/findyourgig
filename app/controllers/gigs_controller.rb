class GigsController < ApplicationController
  before_filter :find_gig, only: [:show, :edit, :update, :destroy, :poster, :remove_poster]
  respond_to :html

  # GET /gigs
  def index
    if params[:search]
      search = Regexp.escape params[:search]
      @gigs = Gig.all({:conditions => ["lower(name) LIKE ?", "%#{search.downcase}%"], include: [{:main_act => :band}, :venue]})
    elsif params[:by_letter]
      @gigs = Gig.includes(:main_act => :band).includes(:venue).by_letter(params[:by_letter].downcase)
    else
      @gigs = Gig.includes(:main_act => :band).includes(:venue).limit(10)
    end
    respond_with @gigs
  end

  # GET /gigs/1
  def show
    @main_act = @gig.main_act
    @supporting_acts = @gig.supporting_acts.includes(:band)
    respond_with @gig
  end

  # GET /gigs/new
  def new
    @my_venue ||= params[:venue_id]
    @gig = Gig.new(:venue_id => @my_venue)
    initialize_acts
    respond_with @gig
  end

  # GET /gigs/1/edit
  def edit
    initialize_acts
  end

  # POST /gigs
  def create
    @gig = Gig.new(params[:gig])

    if @gig.save
      redirect_to @gig, notice: t('gig_created')
    else
      initialize_acts
      render action: "new"
    end
  end

  # PUT /gigs/1
  def update
    if @gig.update_attributes(params[:gig])
      redirect_to @gig, notice: t('gig_updated')
    else
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

  def initialize_acts
    @main_act = (@gig.main_act || @gig.build_main_act)
    @supporting_acts = @gig.supporting_acts
    (4-@supporting_acts.size).times { @gig.supporting_acts.build }
  end
end
