require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TflTeamsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "tfl_teams", :action => "index").should == "/tfl_teams"
    end

    it "maps #new" do
      route_for(:controller => "tfl_teams", :action => "new").should == "/tfl_teams/new"
    end

    it "maps #show" do
      route_for(:controller => "tfl_teams", :action => "show", :id => "1").should == "/tfl_teams/1"
    end

    it "maps #edit" do
      route_for(:controller => "tfl_teams", :action => "edit", :id => "1").should == "/tfl_teams/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "tfl_teams", :action => "create").should == {:path => "/tfl_teams", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "tfl_teams", :action => "update", :id => "1").should == {:path =>"/tfl_teams/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "tfl_teams", :action => "destroy", :id => "1").should == {:path =>"/tfl_teams/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/tfl_teams").should == {:controller => "tfl_teams", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/tfl_teams/new").should == {:controller => "tfl_teams", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/tfl_teams").should == {:controller => "tfl_teams", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/tfl_teams/1").should == {:controller => "tfl_teams", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/tfl_teams/1/edit").should == {:controller => "tfl_teams", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/tfl_teams/1").should == {:controller => "tfl_teams", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/tfl_teams/1").should == {:controller => "tfl_teams", :action => "destroy", :id => "1"}
    end
  end
end
