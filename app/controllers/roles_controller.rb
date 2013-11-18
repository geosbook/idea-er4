class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  
    
  def index
    @roles = Role.all
  end

  def edit

  end

  def update
    if @role.update(role_params)
      redirect_to roles_path, notice: 'Role was successfully updated.'
    else
      render action: 'edit'
    end
  end


  def newchild

    @roleparent = Role.find(params[:id])
    @role = Role.new

  end

  def create
    @role = Role.new(role_params)
    @roleparent = Role.find(@role.parent_id)
    @role.mission_id = @roleparent.mission_id

      if @roleparent.children<<@role
        redirect_to roles_path, notice: 'Role was successfully created.'
      else
        render action: "newchild" 
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
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def role_params
      params.require(:role).permit(:name, :parent_id, :mission_id )
    end

  
  
end
