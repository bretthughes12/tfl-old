require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/afl_teams/new.html.erb" do
  include AflTeamsHelper

  before(:each) do
    assigns[:afl_team] = stub_model(AflTeam,
      :new_record? => true
    )
  end

  it "renders new afl_teams form" do
    render

    response.should have_tag("form[action=?][method=post]", afl_teams_path) do
    end
  end
end
