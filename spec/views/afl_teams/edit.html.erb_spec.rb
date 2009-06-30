require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/afl_teams/edit.html.erb" do
  include AflTeamsHelper

  before(:each) do
    assigns[:afl_teams] = @afl_teams = stub_model(AflTeams,
      :new_record? => false
    )
  end

  it "renders the edit afl_teams form" do
    render

    response.should have_tag("form[action=#{afl_teams_path(@afl_teams)}][method=post]") do
    end
  end
end
