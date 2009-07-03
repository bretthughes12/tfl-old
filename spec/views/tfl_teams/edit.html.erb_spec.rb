require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tfl_teams/edit.html.erb" do
  include TflTeamsHelper

  before(:each) do
    assigns[:tfl_team] = @tfl_team = stub_model(TflTeam,
      :new_record? => false,
      :name => "value for name",
      :abbr => "value for abbr"
    )
  end

  it "renders the edit tfl_team form" do
    render

    response.should have_tag("form[action=#{tfl_team_path(@tfl_team)}][method=post]") do
      with_tag('input#tfl_team_name[name=?]', "tfl_team[name]")
      with_tag('input#tfl_team_abbr[name=?]', "tfl_team[abbr]")
    end
  end
end
