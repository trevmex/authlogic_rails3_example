class ClinicianSessionController < ApplicationController
  before_filter :require_no_clinician, :only => [:new, :create]
  before_filter :require_clinician, :only => :destroy

  # GET /login
  # GET /login.xml
  def new
    @clinician_session = ClinicianSession.new

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @clinician_session }
    end
  end

  # POST /login
  # POST /login.xml
  def create
    @clinician_session = ClinicianSession.new(params[:clinician_session])
    if @clinician_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to clinicians_path, :format => params[:format]
    else
      render :action => 'new', :format => params[:format]
    end
  end

  # DELETE /logout
  # DELETE /logout.xml
  def destroy
    @clinician_session = ClinicianSession.find
    @clinician_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to login_path, :format => params[:format]
  end
end
