require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/afl_teams/show.html.erb" do
  include AflTeamsHelper
  before(:each) do
    assigns[:afl_teams] = @afl_teams = stub_model(AflTeams)
  end

  it "renders attributes in <p>" do
    render
  end
end
