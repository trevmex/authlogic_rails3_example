require 'spec_helper'

describe UserSessionController do
  def mock_user_session(stubs={})
    @mock_user_session ||= mock_model(UserSession, stubs).as_null_object
  end

  describe "when no user is authenticated" do
    before(:each) do
      UserSession.should_receive(:find) { false }
    end

    describe "GET 'new'" do
      it "assigns a new user_session as @user_session" do
        UserSession.stub(:new) { mock_user_session }
        get :new
        assigns(:user_session).should be(mock_user_session)
      end
    end

    describe "POST 'create'" do
      describe "with valid params" do
        it "assigns a newly created user_session as @user_session" do
          UserSession.stub(:new).with({'these' => 'params'}) { mock_user_session(:save => true) }
          post :create, :user_session => {'these' => 'params'}
          assigns(:user_session).should be(mock_user_session)
        end

        it "redirects to the index page" do
          UserSession.stub(:new) { mock_user_session(:save => true) }
          post :create, :user_session => {}
          response.should redirect_to(users_url)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved user_session as @user_session" do
          UserSession.stub(:new).with({'these' => 'params'}) { mock_user_session(:save => false) }
          post :create, :user_session => {'these' => 'params'}
          assigns(:user_session).should be(mock_user_session)
        end

        it "re-renders the 'new' template" do
          UserSession.stub(:new) { mock_user_session(:save => false) }
          post :create, :user_session => {}
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

  describe "when a user is authenticated" do
    before(:each) do
      activate_authlogic
      UserSession.create Factory.build(:user)
    end

    describe "GET 'new'" do
      it "fails to load" do
        get :new
        response.should_not be_success
      end

      it "redirects to the users page" do
        get :new
        response.should redirect_to(users_url)
      end
    end

    describe "POST 'create'" do
      it "fails to load" do
        post :create
        response.should_not be_success
      end

      it "redirects to the users page" do
        post :create
        response.should redirect_to(users_url)
      end
    end

    describe "DELETE 'destroy'" do
      it "destroys the requested user_session" do
        UserSession.should_receive(:find).twice { mock_user_session }
        mock_user_session.should_receive(:destroy)
        delete :destroy
      end

      it "redirects to the login page" do
        UserSession.stub(:find) { mock_user_session }
        delete :destroy
        response.should redirect_to(login_url)
      end
    end
  end

end
