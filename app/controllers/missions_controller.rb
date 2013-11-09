class MissionsController < ApplicationController
  
  def index
    @missions = Mission.all

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @missions }
    end
  end
  
  def listcontexts
    
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])

    respond_to do |format|
      if @mission.update_attributes(params[:mission].permit(:name, :description))
        format.html { redirect_to missions_path, notice: 'Mission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end


  def newchild

    @missionparent = Mission.find(params[:id])
    @mission = Mission.new

  end

  def create
    @mission = Mission.new(params[:mission].permit(:name, :description, :parent_id))
    @missionparent = Mission.find(@mission.parent_id)

    respond_to do |format|
      if @missionparent.children<<@mission
        format.html { redirect_to missions_path, notice: 'Sub-mission was successfully created.' }
        format.json { render json: @mission, status: :created, location: @mission }
      else
        format.html { render action: "newchild" }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end



  def show
    @mission = Mission.find(params[:id])
  end
  
  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy

    respond_to do |format|
      format.html { redirect_to missions_url }
      format.json { head :no_content }
    end
  end
  
  
end
