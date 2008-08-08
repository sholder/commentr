class CommentsController < ApplicationController

  def index
    @page = Page.find(params[:page_id])
    @comments = @page.comments
    respond_to do |format|
      format.html
      format.xml
    end
  end

  def create
    if request.post?
      @comment = Comment.new(params[:comment])
      @comment.save
    end
  end
end
