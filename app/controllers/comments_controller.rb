# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def create
    @comment = UserComment.new(comment_params)
    @comment.project_id = @project.id
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { render(:new, notice: "Comment was successfully created.") }
        format.json { render(:show, status: :created, location: @project) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @project.errors, status: :unprocessable_entity) }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
