module UsersHelper

  def edit_project(user, project)
    link_to "Edit Project", edit_user_project_path(user, project)
  end

  def delete_project(user, project)
    link_to "Delete Project", user_delete_project_path(user, project), method: :delete, confirm: "Are you sure?"
  end

end
