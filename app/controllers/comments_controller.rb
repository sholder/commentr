class CommentsController < ApplicationController
  def list
    p = Page.find(params[:page])
    @comments = p.comments
    respond_to do |format|
      format.html
      format.xml {render :text => 'xml response'}
    end
  end
end
