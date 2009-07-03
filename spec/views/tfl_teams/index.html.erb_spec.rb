require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tfl_teams/index.html.erb" do
  include TflTeamsHelper

  before(:each) do
    assigns[:tfl_teams] = [
      stub_model(TflTeam,
        :name => "value for name",
        :abbr => "value for abbr"
      ),
      stub_model(TflTeam,
        :name => "value for name",
        :abbr => "value for abbr"
      )
    ]
  end

  it "renders a list of tfl_teams" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for abbr".to_s, 2)
  end
end
