class ArticlesController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  layout 'admin_edit'

  # GET /articles
  # GET /articles.xml
  def index
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @articles = Article.all

    @title = "Listing Of Articles Involving ISSJHR"

    @articles = Article.paginate :per_page => 5, :page => params[:page],
    							 :order => 'created_at DESC'

    render :layout => 'application'
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

    @article = Article.find(params[:id])

    @title = "#{@article.title.slice(0, 70)}" + " ..."

    render :layout => 'application'
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    @title = "New article"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])

    @title = "Editing article"
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        flash[:notice] = 'Article was successfully created.'
        format.html { redirect_to(@article) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to(@article) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
end

