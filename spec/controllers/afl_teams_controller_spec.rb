require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AflTeamsController do

  def mock_afl_teams(stubs={})
    @mock_afl_teams ||= mock_model(AflTeams, stubs)
  end

  describe "GET index" do
    it "assigns all afl_teams as @afl_teams" do
      AflTeams.stub!(:find).with(:all).and_return([mock_afl_teams])
      get :index
      assigns[:afl_teams].should == [mock_afl_teams]
    end
  end

  describe "GET show" do
    it "assigns the requested afl_teams as @afl_teams" do
      AflTeams.stub!(:find).with("37").and_return(mock_afl_teams)
      get :show, :id => "37"
      assigns[:afl_teams].should equal(mock_afl_teams)
    end
  end

  describe "GET new" do
    it "assigns a new afl_teams as @afl_teams" do
      AflTeams.stub!(:new).and_return(mock_afl_teams)
      get :new
      assigns[:afl_teams].should equal(mock_afl_teams)
    end
  end

  describe "GET edit" do
    it "assigns the requested afl_teams as @afl_teams" do
      AflTeams.stub!(:find).with("37").and_return(mock_afl_teams)
      get :edit, :id => "37"
      assigns[:afl_teams].should equal(mock_afl_teams)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created afl_teams as @afl_teams" do
        AflTeams.stub!(:new).with({'these' => 'params'}).and_return(mock_afl_teams(:save => true))
        post :create, :afl_teams => {:these => 'params'}
        assigns[:afl_teams].should equal(mock_afl_teams)
      end

      it "redirects to the created afl_teams" do
        AflTeams.stub!(:new).and_return(mock_afl_teams(:save => true))
        post :create, :afl_teams => {}
        response.should redirect_to(afl_team_url(mock_afl_teams))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved afl_teams as @afl_teams" do
        AflTeams.stub!(:new).with({'these' => 'params'}).and_return(mock_afl_teams(:save => false))
        post :create, :afl_teams => {:these => 'params'}
        assigns[:afl_teams].should equal(mock_afl_teams)
      end

      it "re-renders the 'new' template" do
        AflTeams.stub!(:new).and_return(mock_afl_teams(:save => false))
        post :create, :afl_teams => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested afl_teams" do
        AflTeams.should_receive(:find).with("37").and_return(mock_afl_teams)
        mock_afl_teams.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :afl_teams => {:these => 'params'}
      end

      it "assigns the requested afl_teams as @afl_teams" do
        AflTeams.stub!(:find).and_return(mock_afl_teams(:update_attributes => true))
        put :update, :id => "1"
        assigns[:afl_teams].should equal(mock_afl_teams)
      end

      it "redirects to the afl_teams" do
        AflTeams.stub!(:find).and_return(mock_afl_teams(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(afl_team_url(mock_afl_teams))
      end
    end

    describe "with invalid params" do
      it "updates the requested afl_teams" do
        AflTeams.should_receive(:find).with("37").and_return(mock_afl_teams)
        mock_afl_teams.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :afl_teams => {:these => 'params'}
      end

      it "assigns the afl_teams as @afl_teams" do
        AflTeams.stub!(:find).and_return(mock_afl_teams(:update_attributes => false))
        put :update, :id => "1"
        assigns[:afl_teams].should equal(mock_afl_teams)
      end

      it "re-renders the 'edit' template" do
        AflTeams.stub!(:find).and_return(mock_afl_teams(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested afl_teams" do
      AflTeams.should_receive(:find).with("37").and_return(mock_afl_teams)
      mock_afl_teams.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the afl_teams list" do
      AflTeams.stub!(:find).and_return(mock_afl_teams(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(afl_teams_url)
    end
  end

end
