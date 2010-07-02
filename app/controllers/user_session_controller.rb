class UserSessionController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  # GET /login
  # GET /login.xml
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @user_session }
    end
  end

  # POST /login
  # POST /login.xml
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to users_path, :format => params[:format]
    else
      render :action => 'new', :format => params[:format]
    end
  end

  # DELETE /logout
  # DELETE /logout.xml
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to login_path, :format => params[:format]
  end
end
