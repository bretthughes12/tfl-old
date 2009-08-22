require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/players/index.html.erb" do
  include PlayersHelper

  before(:each) do
    afl_team = stub_model(AflTeam,
      :new_record? => false,
      :name => "Tasmania",
      :abbr => "TAS")
    
    tfl_team = stub_model(TflTeam,
      :new_record? => false,
      :name => "Vikings",
      :abbr => "VIK")
    
    assigns[:players] = [
      stub_model(Player,
        :name => "value for name",
        :tfl_code => "value for tfl_code",
        :afl_team => afl_team,
        :tfl_team => tfl_team,
        :keeper => false,
        :rookie => false,
        :category => "value for category",
        :alternate_name => "value for alternate_name"
      ),
      stub_model(Player,
        :name => "value for name",
        :tfl_code => "value for tfl_code",
        :afl_team => afl_team,
        :tfl_team => tfl_team,
        :keeper => false,
        :rookie => false,
        :category => "value for category",
        :alternate_name => "value for alternate_name"
      )
    ]
  end

  it "renders a list of players" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for tfl_code".to_s, 2)
    response.should have_tag("tr>td", "Tasmania", 2)
    response.should have_tag("tr>td", "Vikings", 2)
    response.should have_tag("tr>td", "value for category".to_s, 2)
  end
end
