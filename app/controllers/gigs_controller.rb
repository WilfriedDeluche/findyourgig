class GigsController < ApplicationController
  before_filter :find_gig, only: [:show, :edit, :update, :destroy]
  respond_to :html

  # GET /gigs
  def index
    if params[:search]
      search = Regexp.escape params[:search]
      @gigs = Gig.all({:conditions => ["lower(name) LIKE ?", "%#{search.downcase}%"]})
    elsif params[:by_letter]
      @gigs = Gig.by_letter(params[:by_letter].downcase)
    else
      @gigs = Gig.limit(10)
    end
    respond_with @gigs
  end

  # GET /gigs/1
  def show
    respond_with @gig
  end

  # GET /gigs/new
  def new
    @gig = Gig.new
    respond_with @gig
  end

  # GET /gigs/1/edit
  def edit
  end

  # POST /gigs
  def create
    @gig = Gig.new(params[:gig])

    if @gig.save
      redirect_to @gig, notice: t('gig_created')
    else
      render action: "new"
    end
  end

  # PUT /gigs/1
  def update
    if @gig.update_attributes(params[:gig])
      redirect_to @gig, notice: t('gig_updated')
    else
      render action: "edit"
    end
  end

  # DELETE /gigs/1
  def destroy
    @gig.destroy
    redirect_to gigs_url
  end

  private
  def find_gig
    begin
      @gig = Gig.find(params[:id])
    rescue
      redirect_to gigs_url, alert: t('gig_unknown')
    end
  end
end
