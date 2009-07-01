require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/afl_teams/show.html.erb" do
  include AflTeamsHelper
  before(:each) do
    assigns[:afl_team] = @afl_team = stub_model(AflTeam)
  end

  it "renders attributes in <p>" do
    render
  end
end
