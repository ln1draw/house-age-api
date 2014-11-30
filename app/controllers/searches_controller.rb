class SearchesController < ApplicationController

  def index
    @results = Property.where("address ILIKE ?", "%#{params[:address]}%")
  end

end
