class BandParticipationsController < ApplicationController
  before_filter :user_must_be_band_member, only: [:index]
  respond_to :html

  def index
    @participations = current_user.band_participations.active
  end

  def create
    
  end

  def destroy
    @band_participation = BandParticipation.find_by_id(params[:id])
    if @band_participation && @band_participation.user_id == current_user.id
      @band_participation.destroy
      redirect_to band_participations_path, notice: t('band_participation_removed', band: @band_participation.band.name)
    else
      redirect_to root_path, alert: t('unprocessable_action')
    end
  end

  private

  def user_must_be_band_member
    redirect_to root_path, alert: t('page_unknown') unless current_user.roles_list.include? User::BAND_MEMBER
  end
end
