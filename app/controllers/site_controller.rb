class SiteController < ApplicationController
  def index
  	@title = 'Welcome To The Society For Justice (ISSJHR)'

  	@only_quote = Quote.find(:first)

  	@last_article = Article.find(:last)

  	@first_article = Article.find(:first)

  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")

  	render :layout => 'home_layout'
  end

  def about
  	@title = 'Get To Know About ISSHJR'

  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")
  end

  def contact
  	@title = 'Get In Touch With ISSJHR'

  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")
  end

  def staff
  	@title = 'Management Section of ISSJHR'

  	@last_five_presses = Press.find(:all, :limit => 5, :order => "created_at DESC")
  end

end

