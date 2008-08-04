class CommentsController < ApplicationController
  def list
    @page = Page.find(params[:page])
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
