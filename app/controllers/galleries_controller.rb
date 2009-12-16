class GalleriesController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  layout 'admin_edit'

  # GET /galleries
  # GET /galleries.xml
  def index
    @galleries = Gallery.all

    @galleries = Gallery.paginate :per_page => 16, :page => params[:page], :order => 'created_at DESC'

    @title = 'Welcome To ISSJHR Gallery'

  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    render :layout => 'application'
  end

  # GET /galleries/1
  # GET /galleries/1.xml
  def show
    @gallery = Gallery.find(params[:id])

    @title = 'Welcome To ISSJHR Gallery'

  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.xml
  def new
    @gallery = Gallery.new

    @title = "New picture"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
  end

  # POST /galleries
  # POST /galleries.xml
  def create
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
        flash[:notice] = 'Gallery was successfully created.'
        format.html { redirect_to(@gallery) }
        format.xml  { render :xml => @gallery, :status => :created, :location => @gallery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.xml
  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        flash[:notice] = 'Gallery was successfully updated.'
        format.html { redirect_to(@gallery) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.xml
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to(galleries_url) }
      format.xml  { head :ok }
    end
  end
end

