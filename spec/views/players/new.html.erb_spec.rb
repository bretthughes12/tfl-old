require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/players/new.html.erb" do
  include PlayersHelper

  before(:each) do
    assigns[:player] = stub_model(Player,
      :new_record? => true,
      :name => "value for name",
      :tfl_code => "value for tfl_code",
      :afl_team_id => 1,
      :tfl_team_id => 1,
      :keeper => false,
      :rookie => false,
      :category => "value for category",
      :alternate_name => "value for alternate_name"
    )
    
    assigns[:afl_teams] = @afl_teams = [stub_model(AflTeam,
      :new_record? => false,
      :name => "Tasmania",
      :abbr => "TAS")]
    
    assigns[:tfl_teams] = @tfl_teams = [stub_model(TflTeam,
      :new_record? => false,
      :name => "Vikings",
      :abbr => "VIK")]
  end

  it "renders new player form" do
    render

    response.should have_tag("form[action=?][method=post]", players_path) do
      with_tag("input#player_name[name=?]", "player[name]")
      with_tag("input#player_tfl_code[name=?]", "player[tfl_code]")
      with_tag("select#player_afl_team_id[name=?]", "player[afl_team_id]")
      with_tag("select#player_tfl_team_id[name=?]", "player[tfl_team_id]")
      with_tag("input#player_keeper[name=?]", "player[keeper]")
      with_tag("input#player_rookie[name=?]", "player[rookie]")
      with_tag("select#player_category[name=?]", "player[category]")
      with_tag("input#player_alternate_name[name=?]", "player[alternate_name]")
    end
  end
end
