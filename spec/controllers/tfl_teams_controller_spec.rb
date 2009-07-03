require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TflTeamsController do

  def mock_tfl_team(stubs={})
    @mock_tfl_team ||= mock_model(TflTeam, stubs)
  end

  describe "GET index" do
    it "assigns all tfl_teams as @tfl_teams" do
      TflTeam.stub!(:find).with(:all).and_return([mock_tfl_team])
      get :index
      assigns[:tfl_teams].should == [mock_tfl_team]
    end
  end

  describe "GET show" do
    it "assigns the requested tfl_team as @tfl_team" do
      TflTeam.stub!(:find).with("37").and_return(mock_tfl_team)
      get :show, :id => "37"
      assigns[:tfl_team].should equal(mock_tfl_team)
    end
  end

  describe "GET new" do
    it "assigns a new tfl_team as @tfl_team" do
      TflTeam.stub!(:new).and_return(mock_tfl_team)
      get :new
      assigns[:tfl_team].should equal(mock_tfl_team)
    end
  end

  describe "GET edit" do
    it "assigns the requested tfl_team as @tfl_team" do
      TflTeam.stub!(:find).with("37").and_return(mock_tfl_team)
      get :edit, :id => "37"
      assigns[:tfl_team].should equal(mock_tfl_team)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created tfl_team as @tfl_team" do
        TflTeam.stub!(:new).with({'these' => 'params'}).and_return(mock_tfl_team(:save => true))
        post :create, :tfl_team => {:these => 'params'}
        assigns[:tfl_team].should equal(mock_tfl_team)
      end

      it "redirects to the created tfl_team" do
        TflTeam.stub!(:new).and_return(mock_tfl_team(:save => true))
        post :create, :tfl_team => {}
        response.should redirect_to(tfl_team_url(mock_tfl_team))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tfl_team as @tfl_team" do
        TflTeam.stub!(:new).with({'these' => 'params'}).and_return(mock_tfl_team(:save => false))
        post :create, :tfl_team => {:these => 'params'}
        assigns[:tfl_team].should equal(mock_tfl_team)
      end

      it "re-renders the 'new' template" do
        TflTeam.stub!(:new).and_return(mock_tfl_team(:save => false))
        post :create, :tfl_team => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested tfl_team" do
        TflTeam.should_receive(:find).with("37").and_return(mock_tfl_team)
        mock_tfl_team.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tfl_team => {:these => 'params'}
      end

      it "assigns the requested tfl_team as @tfl_team" do
        TflTeam.stub!(:find).and_return(mock_tfl_team(:update_attributes => true))
        put :update, :id => "1"
        assigns[:tfl_team].should equal(mock_tfl_team)
      end

      it "redirects to the tfl_team" do
        TflTeam.stub!(:find).and_return(mock_tfl_team(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(tfl_team_url(mock_tfl_team))
      end
    end

    describe "with invalid params" do
      it "updates the requested tfl_team" do
        TflTeam.should_receive(:find).with("37").and_return(mock_tfl_team)
        mock_tfl_team.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tfl_team => {:these => 'params'}
      end

      it "assigns the tfl_team as @tfl_team" do
        TflTeam.stub!(:find).and_return(mock_tfl_team(:update_attributes => false))
        put :update, :id => "1"
        assigns[:tfl_team].should equal(mock_tfl_team)
      end

      it "re-renders the 'edit' template" do
        TflTeam.stub!(:find).and_return(mock_tfl_team(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested tfl_team" do
      TflTeam.should_receive(:find).with("37").and_return(mock_tfl_team)
      mock_tfl_team.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the tfl_teams list" do
      TflTeam.stub!(:find).and_return(mock_tfl_team(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(tfl_teams_url)
    end
  end

end
