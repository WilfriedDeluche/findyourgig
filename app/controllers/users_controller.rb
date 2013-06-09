class UsersController < ApplicationController
  before_filter :find_user

  def show
    if current_user.is_venue_manager?
      @managerships = current_user.managerships.includes(:venue => :main_image)
    end
    if current_user.is_band_member?
      @participations = current_user.band_participations.active.order("date_joined DESC").includes(:band => :main_image)
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user), notice: t('.user_updated')
    else
      render action: :edit
    end
  end

  def find_user
    begin
      @user = User.find(params[:id])
    rescue
      redirect_to root_path
    end
  end
end
