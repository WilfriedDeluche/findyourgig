require 'spec_helper'

describe ApplicationHelper do

  it "should return activated Devise modules" do
    helper.devise_mapping.modules.should include :database_authenticatable
    helper.devise_mapping.modules.should include :registerable
    helper.devise_mapping.modules.should include :recoverable
    helper.devise_mapping.modules.should include :rememberable
    helper.devise_mapping.modules.should include :trackable
    helper.devise_mapping.modules.should include :validatable
    helper.devise_mapping.modules.should_not include :confirmable
    helper.devise_mapping.modules.should_not include :lockable
    helper.devise_mapping.modules.should_not include :timeoutable
    helper.devise_mapping.modules.should_not include :omniauthable
  end

  it "should return public roles" do
    helper.available_roles_for_public_user.should include [I18n.t('band_member'), 'band_member']
    helper.available_roles_for_public_user.should include [I18n.t('venue_manager'), 'venue_manager']
    helper.available_roles_for_public_user.should_not include [I18n.t('admin'), 'admin']
  end
end