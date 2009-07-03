require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tfl_teams/show.html.erb" do
  include TflTeamsHelper
  before(:each) do
    assigns[:tfl_team] = @tfl_team = stub_model(TflTeam,
      :name => "value for name",
      :abbr => "value for abbr"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ abbr/)
  end
end
