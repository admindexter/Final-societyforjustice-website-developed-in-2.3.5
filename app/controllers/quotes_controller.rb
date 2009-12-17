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

  # GET /quotes/1/edit
  def edit
    @title = "Editing daily quote"

    @quote = Quote.find(params[:id])
  end

  # PUT /quotes/1
  # PUT /quotes/1.xml
  def update
    @quote = Quote.find(params[:id])

    if @quote.update_attributes(params[:quote])
      flash[:notice] = 'Quote was successfully updated.'
        redirect_to home_path
    else
      render :action => "edit"
    end
  end
end

