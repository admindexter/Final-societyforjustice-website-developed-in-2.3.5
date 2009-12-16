class QuotesController < ApplicationController
  before_filter :authorize
  layout 'admin_edit'

  # GET /quotes
  # GET /quotes.xml
  def index
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @quotes = Quote.all

    @title = "Showing ISSJHR daily quote"

    render :layout => 'application'
  end

  # GET /quotes/1
  # GET /quotes/1.xml
  def show
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @quote = Quote.find(params[:id])

    @title = "#{@quote.passage.slice(0, 70)}" + " ..."

    render :layout => 'application'
  end

  # GET /quotes/1/edit
  def edit
    @title = "Editing daily quote"

    @quote = Quote.find(params[:id])
  end

  # POST /quotes
  # POST /quotes.xml
  def create
    @quote = Quote.new(params[:quote])

    respond_to do |format|
      if @quote.save
        flash[:notice] = 'Quote was successfully created.'
        format.html { redirect_to(@quote) }
        format.xml  { render :xml => @quote, :status => :created, :location => @quote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quotes/1
  # PUT /quotes/1.xml
  def update
    @quote = Quote.find(params[:id])

    respond_to do |format|
      if @quote.update_attributes(params[:quote])
        flash[:notice] = 'Quote was successfully updated.'
        format.html { redirect_to(@quote) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.xml
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to(quotes_url) }
      format.xml  { head :ok }
    end
  end
end

