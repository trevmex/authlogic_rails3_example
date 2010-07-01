require "spec_helper"

describe CliniciansController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/clinicians" }.should route_to(:controller => "clinicians", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/clinicians/new" }.should route_to(:controller => "clinicians", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/clinicians/1" }.should route_to(:controller => "clinicians", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/clinicians/1/edit" }.should route_to(:controller => "clinicians", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/clinicians" }.should route_to(:controller => "clinicians", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/clinicians/1" }.should route_to(:controller => "clinicians", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/clinicians/1" }.should route_to(:controller => "clinicians", :action => "destroy", :id => "1") 
    end

  end
end
