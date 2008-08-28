class CommentsController < ApplicationController

  caches_page :index
  
  def index
    @page = Page.find(params[:page_id])
    @comments = @page.comments
    respond_to do |format|
      format.html
      format.xml {@comment = Comment.new(:page => @page)}
    end
  end

  def create
    # TODO(sholder) preserve the name used for commenting in a cookie
    @comment = Comment.new(params[:comment])
    if(@comment.save)
      expire_page :action => 'index', :page_id => @comment.page.id
      expire_page :controller => 'sites', :action => 'show', :id => @comment.page.site.id
    end    
  end
end
