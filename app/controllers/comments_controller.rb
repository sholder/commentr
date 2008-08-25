class CommentsController < ApplicationController

  def index
    @page = Page.find(params[:page_id])
    @comments = @page.comments
    respond_to do |format|
      format.html
      format.xml {@comment = Comment.new(:page => @page)}
    end
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.save
  end
end
