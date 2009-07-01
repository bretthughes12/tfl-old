require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/afl_teams/index.html.erb" do
  include AflTeamsHelper

  before(:each) do
    assigns[:afl_teams] = [
      stub_model(AflTeam),
      stub_model(AflTeam)
    ]
  end

  it "renders a list of afl_teams" do
    render
  end
end
