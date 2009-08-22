require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/players/show.html.erb" do
  include PlayersHelper
  before(:each) do
    assigns[:player] = @player = stub_model(Player,
      :name => "value for name",
      :tfl_code => "value for tfl_code",
      :afl_team_id => 1,
      :tfl_team_id => 1,
      :keeper => false,
      :rookie => false,
      :category => "value for category",
      :alternate_name => "value for alternate_name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ tfl_code/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/false/)
    response.should have_text(/false/)
    response.should have_text(/value\ for\ category/)
    response.should have_text(/value\ for\ alternate_name/)
  end
end
