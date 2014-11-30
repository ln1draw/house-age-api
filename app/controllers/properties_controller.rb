class PropertiesController < ApplicationController

  def index
    @properties = Property.where("id > 0 AND id < 21")
  end

  def show
    @property = Property.find(params[:id])
  end

end
