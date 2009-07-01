require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AflTeamsController do

  def mock_afl_team(stubs={})
    @mock_afl_team ||= mock_model(AflTeam, stubs)
  end

  describe "GET index" do
    it "assigns all afl_teams as @afl_teams" do
      AflTeam.stub!(:find).with(:all, :order => :name).and_return([mock_afl_team])
      get :index
      assigns[:afl_teams].should == [mock_afl_team]
    end
  end

  describe "GET show" do
    it "assigns the requested afl_teams as @afl_teams" do
      AflTeam.stub!(:find).with("37").and_return(mock_afl_team)
      get :show, :id => "37"
      assigns[:afl_team].should equal(mock_afl_team)
    end
  end

  describe "GET new" do
    it "assigns a new afl_teams as @afl_teams" do
      AflTeam.stub!(:new).and_return(mock_afl_team)
      get :new
      assigns[:afl_team].should equal(mock_afl_team)
    end
  end

  describe "GET edit" do
    it "assigns the requested afl_teams as @afl_teams" do
      AflTeam.stub!(:find).with("37").and_return(mock_afl_team)
      get :edit, :id => "37"
      assigns[:afl_team].should equal(mock_afl_team)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created afl_teams as @afl_teams" do
        AflTeam.stub!(:new).with({'these' => 'params'}).and_return(mock_afl_team(:save => true))
        post :create, :afl_team => {:these => 'params'}
        assigns[:afl_team].should equal(mock_afl_team)
      end

      it "redirects to the created afl_teams" do
        AflTeam.stub!(:new).and_return(mock_afl_team(:save => true))
        post :create, :afl_team => {}
        response.should redirect_to(afl_team_url(mock_afl_team))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved afl_teams as @afl_team" do
        AflTeam.stub!(:new).with({'these' => 'params'}).and_return(mock_afl_team(:save => false))
        post :create, :afl_team => {:these => 'params'}
        assigns[:afl_team].should equal(mock_afl_team)
      end

      it "re-renders the 'new' template" do
        AflTeam.stub!(:new).and_return(mock_afl_team(:save => false))
        post :create, :afl_team => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested afl_teams" do
        AflTeam.should_receive(:find).with("37").and_return(mock_afl_team)
        mock_afl_team.should_receive(:update_attributes).with({'name' => 'Kangaroo Island'})
        put :update, :id => "37", :afl_team => {:name => 'Kangaroo Island'}
      end

      it "assigns the requested afl_teams as @afl_team" do
        AflTeam.stub!(:find).and_return(mock_afl_team(:update_attributes => true))
        put :update, :id => "1"
        assigns[:afl_team].should equal(mock_afl_team)
      end

      it "redirects to the afl_teams" do
        AflTeam.stub!(:find).and_return(mock_afl_team(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(afl_team_url(mock_afl_team))
      end
    end

    describe "with invalid params" do
      it "updates the requested afl_teams" do
        AflTeam.should_receive(:find).with("37").and_return(mock_afl_team)
        mock_afl_team.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :afl_team => {:these => 'params'}
      end

      it "assigns the afl_teams as @afl_team" do
        AflTeam.stub!(:find).and_return(mock_afl_team(:update_attributes => false))
        put :update, :id => "1"
        assigns[:afl_team].should equal(mock_afl_team)
      end

      it "re-renders the 'edit' template" do
        AflTeam.stub!(:find).and_return(mock_afl_team(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested AFL Team" do
      AflTeam.should_receive(:find).with("37").and_return(mock_afl_team)
      mock_afl_team.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the AFL Teams list" do
      AflTeam.stub!(:find).and_return(mock_afl_team(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(afl_teams_url)
    end
  end

end
