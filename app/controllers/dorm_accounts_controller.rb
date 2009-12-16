class DormAccountsController < ApplicationController
  layout 'admin_edit'

  # GET /dorm_accounts/1/edit
  def edit
    @dorm_account = DormAccount.find(params[:id])
    
    @title = 'Editing account'
  end

  # PUT /dorm_accounts/1
  # PUT /dorm_accounts/1.xml
  def update
    @dorm_account = DormAccount.find(params[:id])

    respond_to do |format|
      if @dorm_account.update_attributes(params[:dorm_account])
        flash[:notice] = 'DormAccount was successfully updated.'
        format.html { redirect_to donate_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dorm_account.errors, :status => :unprocessable_entity }
      end
    end
  end
end
