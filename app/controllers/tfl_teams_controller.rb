class TflTeamsController < ApplicationController
  # GET /tfl_teams
  # GET /tfl_teams.xml
  def index
    @tfl_teams = TflTeam.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tfl_teams }
    end
  end

  # GET /tfl_teams/1
  # GET /tfl_teams/1.xml
  def show
    @tfl_team = TflTeam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tfl_team }
    end
  end

  # GET /tfl_teams/new
  # GET /tfl_teams/new.xml
  def new
    @tfl_team = TflTeam.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tfl_team }
    end
  end

  # GET /tfl_teams/1/edit
  def edit
    @tfl_team = TflTeam.find(params[:id])
  end

  # POST /tfl_teams
  # POST /tfl_teams.xml
  def create
    @tfl_team = TflTeam.new(params[:tfl_team])

    respond_to do |format|
      if @tfl_team.save
        flash[:notice] = 'TflTeam was successfully created.'
        format.html { redirect_to(@tfl_team) }
        format.xml  { render :xml => @tfl_team, :status => :created, :location => @tfl_team }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tfl_team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tfl_teams/1
  # PUT /tfl_teams/1.xml
  def update
    @tfl_team = TflTeam.find(params[:id])

    respond_to do |format|
      if @tfl_team.update_attributes(params[:tfl_team])
        flash[:notice] = 'TflTeam was successfully updated.'
        format.html { redirect_to(@tfl_team) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tfl_team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tfl_teams/1
  # DELETE /tfl_teams/1.xml
  def destroy
    @tfl_team = TflTeam.find(params[:id])
    @tfl_team.destroy

    respond_to do |format|
      format.html { redirect_to(tfl_teams_url) }
      format.xml  { head :ok }
    end
  end
end
