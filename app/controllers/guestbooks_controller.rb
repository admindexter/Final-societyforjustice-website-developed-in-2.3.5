class GuestbooksController < ApplicationController
  layout 'admin_edit'

  # GET /guestbooks
  # GET /guestbooks.xml
  def index
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @guestbooks = Guestbook.all

    @title = "Listing Of Guestbooks Involving ISSJHR"

    @guestbooks = Guestbook.paginate :per_page => 10, :page => params[:page], :order => 'created_at DESC'

    render :layout => 'application'
  end

  # GET /guestbooks/1
  # GET /guestbooks/1.xml
  def show
    redirect_to donate_path
  end

  # GET /guestbooks/new
  # GET /guestbooks/new.xml
  def new
    @guestbook = Guestbook.new

    @title = "New guestbook"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @guestbook }
    end
  end

  # GET /guestbooks/1/edit
  def edit
    @guestbook = Guestbook.find(params[:id])

    @title = "Editing guestbook"
  end

  # POST /guestbooks
  # POST /guestbooks.xml
  def create
    @guestbook = Guestbook.new(params[:guestbook])

    respond_to do |format|
      if @guestbook.save
        flash[:notice] = 'Guestbook was successfully logged.'
        format.html { redirect_to(@guestbook) }
        format.xml  { render :xml => @guestbook, :status => :created, :location => @guestbook }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @guestbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /guestbooks/1
  # PUT /guestbooks/1.xml
  def update
    @guestbook = Guestbook.find(params[:id])

    respond_to do |format|
      if @guestbook.update_attributes(params[:guestbook])
        flash[:notice] = 'Guestbook was successfully updated.'
        format.html { redirect_to(@guestbook) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @guestbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /guestbooks/1
  # DELETE /guestbooks/1.xml
  def destroy
    @guestbook = Guestbook.find(params[:id])
    @guestbook.destroy

    respond_to do |format|
      format.html { redirect_to(guestbooks_url) }
      format.xml  { head :ok }
    end
  end

  def donate
  	@title = 'You can be of help to others please donate or fill our guestbook!'

  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @last_account = Account.find(:last)

    @last_dorm_account = DormAccount.find(:last)

    @guestbook = Guestbook.new

    render :layout => 'application'
  end
end

