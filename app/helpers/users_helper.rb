module UsersHelper
  def show_user_link(current_user, user)
    if current_user.admin?
      "#{link_to user.to_s, edit_user_path(user)}".html_safe
    end
  end

  def delete_user_link(current_user, user)
    if current_user.admin? && current_user != user
      "| #{link_to "Delete", admin_destroy_user_path(user), method: :delete, data: { confirm: "Delete #{user}?" }, class: "lnk-danger", title: "Delete #{user}"}".html_safe
    end
  end

  def make_user_admin_link(current_user, user)
    if current_user.admin? && current_user != user
       "| #{link_to "Enable admin privileges", set_admin_path(user),  method: :get, data: { confirm: "Make #{user} an adminstrator?" }}".html_safe
    end
  end
end
