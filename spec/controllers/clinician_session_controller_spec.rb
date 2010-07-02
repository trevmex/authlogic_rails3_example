require 'spec_helper'

describe ClinicianSessionController do
  def mock_clinician_session(stubs={})
    @mock_clinician_session ||= mock_model(ClinicianSession, stubs).as_null_object
  end

  describe "when no clinician is authenticated" do
    before(:each) do
      ClinicianSession.should_receive(:find) { false }
    end

    describe "GET 'new'" do
      it "assigns a new clinician_session as @clinician_session" do
        ClinicianSession.stub(:new) { mock_clinician_session }
        get :new
        assigns(:clinician_session).should be(mock_clinician_session)
      end
    end

    describe "POST 'create'" do
      describe "with valid params" do
        it "assigns a newly created clinician_session as @clinician_session" do
          ClinicianSession.stub(:new).with({'these' => 'params'}) { mock_clinician_session(:save => true) }
          post :create, :clinician_session => {'these' => 'params'}
          assigns(:clinician_session).should be(mock_clinician_session)
        end

        it "redirects to the index page" do
          ClinicianSession.stub(:new) { mock_clinician_session(:save => true) }
          post :create, :clinician_session => {}
          response.should redirect_to(clinicians_url)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved clinician_session as @clinician_session" do
          ClinicianSession.stub(:new).with({'these' => 'params'}) { mock_clinician_session(:save => false) }
          post :create, :clinician_session => {'these' => 'params'}
          assigns(:clinician_session).should be(mock_clinician_session)
        end

        it "re-renders the 'new' template" do
          ClinicianSession.stub(:new) { mock_clinician_session(:save => false) }
          post :create, :clinician_session => {}
          response.should render_template("new")
        end
      end
    end

    describe "DELETE 'destroy'" do
      it "fails to load" do
        delete :destroy
        response.should_not be_success
      end

      it "redirects to the login page" do
        delete :destroy
        response.should redirect_to(login_url)
      end
    end
  end

  describe "when a clinician is authenticated" do
    before(:each) do
      activate_authlogic
      ClinicianSession.create Factory.build(:clinician)
    end

    describe "GET 'new'" do
      it "fails to load" do
        get :new
        response.should_not be_success
      end

      it "redirects to the clinicians page" do
        get :new
        response.should redirect_to(clinicians_url)
      end
    end

    describe "POST 'create'" do
      it "fails to load" do
        post :create
        response.should_not be_success
      end

      it "redirects to the clinicians page" do
        post :create
        response.should redirect_to(clinicians_url)
      end
    end

    describe "DELETE 'destroy'" do
      it "destroys the requested clinician_session" do
        ClinicianSession.should_receive(:find).twice { mock_clinician_session }
        mock_clinician_session.should_receive(:destroy)
        delete :destroy
      end

      it "redirects to the login page" do
        ClinicianSession.stub(:find) { mock_clinician_session }
        delete :destroy
        response.should redirect_to(login_url)
      end
    end
  end

end
