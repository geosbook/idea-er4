class RolesController < ApplicationController
  
    
  def index
    @roles = Role.all

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roles }
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role].permit(:role))
        format.html { redirect_to roles_path, notice: 'Role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end


  def newchild

    @roleparent = Role.find(params[:id])
    @role = Role.new

  end

  def newrole

    @mission = Mission.find(params[:id])
    @role = Role.new

  end

  def create
    @role = Role.new(params[:role].permit!)
    @roleparent = Role.find(@role.parent_id)

    respond_to do |format|
      if @roleparent.children<<@role
        format.html { redirect_to roles_path, notice: 'Sub-role was successfully created.' }
        format.json { render json: @role, status: :created, location: @role }
      else
        format.html { render action: "newchild" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end



  def show
    @eolw = Role.find(params[:id])
  end
  
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :no_content }
    end
  end
  

  
  
end
