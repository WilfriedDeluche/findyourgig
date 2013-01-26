module ApplicationHelper
  def devise_mapping
    Devise.mappings[:user]
  end

  def available_roles_for_public_user
    User.available_roles_for_public.collect{ |role| [I18n.t(role), role] }
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
end
