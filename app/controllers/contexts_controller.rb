class ContextsController < ApplicationController
  
  def index
      @contexts = Context.all

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contexts }
    end
    
  end
  def list
      @contexts = Context.where(mission_id: params[:id])

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contexts }
    end
    
  end
end
