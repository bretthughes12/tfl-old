class AflTeamsController < ApplicationController
  # GET /afl_teams
  # GET /afl_teams.xml
  def index
    @afl_teams = AflTeam.find(:all, :order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @afl_teams }
    end
  end

  # GET /afl_teams/1
  # GET /afl_teams/1.xml
  def show
    @afl_team = AflTeam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @afl_team }
    end
  end

  # GET /afl_teams/new
  # GET /afl_teams/new.xml
  def new
    @afl_team = AflTeam.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @afl_team }
    end
  end

  # GET /afl_teams/1/edit
  def edit
    @afl_team = AflTeam.find(params[:id])
  end

  # POST /afl_teams
  # POST /afl_teams.xml
  def create
    @afl_team = AflTeam.new(params[:afl_team])

    respond_to do |format|
      if @afl_team.save
        flash[:notice] = 'AFL Team was successfully created.'
        format.html { redirect_to(@afl_team) }
        format.xml  { render :xml => @afl_team, :status => :created, :location => @afl_team }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @afl_team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /afl_teams/1
  # PUT /afl_teams/1.xml
  def update
    @afl_team = AflTeam.find(params[:id])

    respond_to do |format|
      if @afl_team.update_attributes(params[:afl_team])
        flash[:notice] = 'AFL Team was successfully updated.'
        format.html { redirect_to(@afl_team) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @afl_team.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /afl_teams/1
  # DELETE /afl_teams/1.xml
  def destroy
    @afl_team = AflTeam.find(params[:id])
    @afl_team.destroy

    respond_to do |format|
      format.html { redirect_to(afl_teams_url) }
      format.xml  { head :ok }
    end
  end
end
