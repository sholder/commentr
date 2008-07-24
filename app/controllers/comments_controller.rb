class CommentsController < ApplicationController
  def list
    p = Page.find(params[:page])
    @comments = p.comments
    render :text => 'test'
  end
end
