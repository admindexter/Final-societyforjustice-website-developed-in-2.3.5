class PressesController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  layout 'admin_edit'

  # GET /presses
  # GET /presses.xml
  def index
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @presses = Press.all

    @title = "Listing Of Presses Involving ISSJHR"

    @presses = Press.paginate :per_page => 5, :page => params[:page],
    							 :order => 'created_at DESC'

    render :layout => 'application'
  end

  # GET /presses/1
  # GET /presses/1.xml
  def show

  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @press = Press.find(params[:id])

    @title = "#{@press.title.slice(0, 70)}" + " ..."

    render :layout => 'application'
  end

  # GET /presses/new
  # GET /presses/new.xml
  def new
    @press = Press.new

    @title = "New press"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @press }
    end
  end

  # GET /presses/1/edit
  def edit
    @press = Press.find(params[:id])

    @title = "Editing press"
  end

  # POST /presses
  # POST /presses.xml
  def create
    @press = Press.new(params[:press])

    respond_to do |format|
      if @press.save
        flash[:notice] = 'Press was successfully created.'
        format.html { redirect_to(@press) }
        format.xml  { render :xml => @press, :status => :created, :location => @press }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @press.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /presses/1
  # PUT /presses/1.xml
  def update
    @press = Press.find(params[:id])

    respond_to do |format|
      if @press.update_attributes(params[:press])
        flash[:notice] = 'Press was successfully updated.'
        format.html { redirect_to(@press) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @press.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /presses/1
  # DELETE /presses/1.xml
  def destroy
    @press = Press.find(params[:id])
    @press.destroy

    respond_to do |format|
      format.html { redirect_to(presses_url) }
      format.xml  { head :ok }
    end
  end
end

