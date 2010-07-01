require 'spec_helper'

describe CliniciansController do

  def mock_clinician(stubs={})
    @mock_clinician ||= mock_model(Clinician, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all clinicians as @clinicians" do
      Clinician.stub(:all) { [mock_clinician] }
      get :index
      assigns(:clinicians).should eq([mock_clinician])
    end
  end

  describe "GET show" do
    it "assigns the requested clinician as @clinician" do
      Clinician.stub(:find).with("37") { mock_clinician }
      get :show, :id => "37"
      assigns(:clinician).should be(mock_clinician)
    end
  end

  describe "GET new" do
    it "assigns a new clinician as @clinician" do
      Clinician.stub(:new) { mock_clinician }
      get :new
      assigns(:clinician).should be(mock_clinician)
    end
  end

  describe "GET edit" do
    it "assigns the requested clinician as @clinician" do
      Clinician.stub(:find).with("37") { mock_clinician }
      get :edit, :id => "37"
      assigns(:clinician).should be(mock_clinician)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created clinician as @clinician" do
        Clinician.stub(:new).with({'these' => 'params'}) { mock_clinician(:save => true) }
        post :create, :clinician => {'these' => 'params'}
        assigns(:clinician).should be(mock_clinician)
      end

      it "redirects to the created clinician" do
        Clinician.stub(:new) { mock_clinician(:save => true) }
        post :create, :clinician => {}
        response.should redirect_to(clinician_url(mock_clinician))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved clinician as @clinician" do
        Clinician.stub(:new).with({'these' => 'params'}) { mock_clinician(:save => false) }
        post :create, :clinician => {'these' => 'params'}
        assigns(:clinician).should be(mock_clinician)
      end

      it "re-renders the 'new' template" do
        Clinician.stub(:new) { mock_clinician(:save => false) }
        post :create, :clinician => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested clinician" do
        Clinician.should_receive(:find).with("37") { mock_clinician }
        mock_clinician.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :clinician => {'these' => 'params'}
      end

      it "assigns the requested clinician as @clinician" do
        Clinician.stub(:find) { mock_clinician(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:clinician).should be(mock_clinician)
      end

      it "redirects to the clinician" do
        Clinician.stub(:find) { mock_clinician(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(clinician_url(mock_clinician))
      end
    end

    describe "with invalid params" do
      it "assigns the clinician as @clinician" do
        Clinician.stub(:find) { mock_clinician(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:clinician).should be(mock_clinician)
      end

      it "re-renders the 'edit' template" do
        Clinician.stub(:find) { mock_clinician(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested clinician" do
      Clinician.should_receive(:find).with("37") { mock_clinician }
      mock_clinician.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the clinicians list" do
      Clinician.stub(:find) { mock_clinician }
      delete :destroy, :id => "1"
      response.should redirect_to(clinicians_url)
    end
  end

end
