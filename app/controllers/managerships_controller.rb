class ManagershipsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :user_must_be_venue_manager, only: [:index]
  respond_to :html

  def index
    @managerships = current_user.managerships.includes(:venue => :main_image)
  end

  private
  def user_must_be_venue_manager
    redirect_to root_path, alert: t('page_unknown') unless current_user.is_venue_manager?
  end
end
