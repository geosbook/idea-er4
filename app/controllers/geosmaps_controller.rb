class GeosmapsController < ApplicationController
  
  def list
          @geosmaps = Geosmap.where(context_id: params[:id])
  end

  def display
    
    @geosmap = Geosmap.find(params[:id])
    render 'display', :layout => 'map' 

  end
  def currentmap
    
    @geosmap = Geosmap.find(params[:id])
    render :text => Geosmap.find(params[:id]).to_json

  end

  
end
