require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tfl_teams/new.html.erb" do
  include TflTeamsHelper

  before(:each) do
    assigns[:tfl_team] = stub_model(TflTeam,
      :new_record? => true,
      :name => "value for name",
      :abbr => "value for abbr"
    )
  end

  it "renders new tfl_team form" do
    render

    response.should have_tag("form[action=?][method=post]", tfl_teams_path) do
      with_tag("input#tfl_team_name[name=?]", "tfl_team[name]")
      with_tag("input#tfl_team_abbr[name=?]", "tfl_team[abbr]")
    end
  end
end
