class CliniciansController < ApplicationController
  before_filter :require_clinician, :except => [:new, :create]

  # GET /clinicians
  # GET /clinicians.xml
  def index
    @clinicians = Clinician.all

    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @clinicians }
    end
  end

  # GET /clinicians/1
  # GET /clinicians/1.xml
  def show
    @clinician = Clinician.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.xml  { render :xml => @clinician }
    end
  end

  # GET /clinicians/new
  # GET /clinicians/new.xml
  def new
    @clinician = Clinician.new

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @clinician }
    end
  end

  # GET /clinicians/1/edit
  def edit
    @clinician = Clinician.find(params[:id])
  end

  # POST /clinicians
  # POST /clinicians.xml
  def create
    @clinician = Clinician.new(params[:clinician])

    respond_to do |format|
      if @clinician.save
        format.html { redirect_to(@clinician, :notice => 'Clinician was successfully created.') }
        format.xml  { render :xml => @clinician, :status => :created, :location => @clinician }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @clinician.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clinicians/1
  # PUT /clinicians/1.xml
  def update
    @clinician = Clinician.find(params[:id])

    respond_to do |format|
      if @clinician.update_attributes(params[:clinician])
        format.html { redirect_to(@clinician, :notice => 'Clinician was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @clinician.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clinicians/1
  # DELETE /clinicians/1.xml
  def destroy
    @clinician = Clinician.find(params[:id])
    @clinician.destroy

    respond_to do |format|
      format.html { redirect_to(clinicians_url) }
      format.xml  { head :ok }
    end
  end
end
