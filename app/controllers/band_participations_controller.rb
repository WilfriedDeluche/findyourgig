class BandParticipationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :user_must_be_band_member, only: [:index]
  before_filter :find_band_participation, only: [:destroy, :set_administration_rights]
  before_filter :only_member_admin, only: [:set_administration_rights]
  respond_to :html

  def index
    @participations = current_user.band_participations.active
  end

  def set_administration_rights
    @bp.update_attribute(:is_admin, !@bp.is_admin)
    is_admin_notice = @bp.is_admin ? 'user_rights_is_admin' : 'user_rights_not_admin'
    redirect_to members_band_path(@bp.band), notice: t(is_admin_notice, user: @bp.user.name).html_safe
  end

  def destroy
    if @bp.user_id == current_user.id
      @bp.destroy
      redirect_to band_participations_path, notice: t('band_participation_removed', band: @bp.band.name)
    else
      redirect_to root_path, alert: t('unprocessable_action')
    end
  end

  private
  def find_band_participation
    begin
      @bp = BandParticipation.find_by_id(params[:id])
    rescue
      redirect_to root_path, alert: t('band_participation_unknown')
    end
  end

  def only_member_admin
    unless current_user.band_participations.detect { |part| part.band_id == @bp.band_id && part.is_admin }
      redirect_to bands_path, alert: t('page_unknown')
    end
  end

  def user_must_be_band_member
    redirect_to root_path, alert: t('page_unknown') unless current_user.roles_list.include? User::BAND_MEMBER
  end
end
