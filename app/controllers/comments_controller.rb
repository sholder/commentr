class CommentsController < ApplicationController
  def list
    @page = Page.find(params[:page])
    @comments = @page.comments
    respond_to do |format|
      format.html
      format.xml
    end
  end
end
