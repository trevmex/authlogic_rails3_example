require "spec_helper"

describe UserSessionController do
  describe "routing" do

    it "recognizes and generates #new" do
      { :get => "/login" }.should route_to(:controller => "user_session", :action => "new")
    end

    it "recognizes and generates #create" do
      { :post => "/login" }.should route_to(:controller => "user_session", :action => "create")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/logout" }.should route_to(:controller => "user_session", :action => "destroy")
    end

  end
end
