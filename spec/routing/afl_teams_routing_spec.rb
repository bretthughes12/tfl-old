require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AflTeamsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "afl_teams", :action => "index").should == "/afl_teams"
    end

    it "maps #new" do
      route_for(:controller => "afl_teams", :action => "new").should == "/afl_teams/new"
    end

    it "maps #show" do
      route_for(:controller => "afl_teams", :action => "show", :id => "1").should == "/afl_teams/1"
    end

    it "maps #edit" do
      route_for(:controller => "afl_teams", :action => "edit", :id => "1").should == "/afl_teams/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "afl_teams", :action => "create").should == {:path => "/afl_teams", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "afl_teams", :action => "update", :id => "1").should == {:path =>"/afl_teams/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "afl_teams", :action => "destroy", :id => "1").should == {:path =>"/afl_teams/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/afl_teams").should == {:controller => "afl_teams", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/afl_teams/new").should == {:controller => "afl_teams", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/afl_teams").should == {:controller => "afl_teams", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/afl_teams/1").should == {:controller => "afl_teams", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/afl_teams/1/edit").should == {:controller => "afl_teams", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/afl_teams/1").should == {:controller => "afl_teams", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/afl_teams/1").should == {:controller => "afl_teams", :action => "destroy", :id => "1"}
    end
  end
end
