class ProjectCommentsController < ApplicationController

  def create
    puts params.inspect
    @user = User.find_by(id: params[:user_id])
    @project = @user.projects.find_by(id: params[:id])
    @current_user = current_user
    @comment = ProjectComment.new(comment_params)
    if @comment.save
      render json: @comment, username: current_user
    else
      render controller: 'project', action: 'show', user_id: @user, id: @project
    end
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @project = @user.projects.find_by(id: params[:id])
    @comments = @project.project_comments
    render json: @comments
  end

  private

  def comment_params
    params.require(:project_comment).permit(:user_id, :project_id, :comment)
  end

end
