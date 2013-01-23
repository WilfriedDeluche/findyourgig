module ApplicationHelper
  def devise_mapping
    Devise.mappings[:user]
  end

  def available_roles_for_public_user
    User.available_roles_for_public.collect{ |role| [I18n.t(role), role] }
  end
end
