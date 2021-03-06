class PagesController < ApplicationController

  before_filter :admin_only

  # GET /pages
  # GET /pages.xml
  def index
    @pages = Page.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])
    @page.site = Site.find(params[:site_id])


    respond_to do |format|
      if @page.save
        expire_site_cache
        flash[:notice] = 'page was successfully created.'
        format.html { redirect_to(@page) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
        format.js   { render :update do |page| 
            page.insert_html :bottom, 'pagelist', :partial => 'page_summary', :object => @page 
        end }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        expire_site_cache
        flash[:notice] = 'page was successfully updated.'
        format.html { redirect_to(@page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    expire_site_cache

    respond_to do |format|
      format.html { redirect_to(pages_url) }
      format.xml  { head :ok }
      format.js { render :update do |page|
        page.remove "page#{@page.id}"
      end }
    end
  end

  private
  
  def expire_site_cache
    expire_page :controller => 'sites', :action => 'show', :id => @page.site.id
  end

end
