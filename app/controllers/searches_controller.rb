class SearchesController < ApplicationController

  def index
    ## this bit makes URL get requests work...
    # @results = Property.where("address ILIKE ?", "%#{params[:q]}%")
    # render :results
  end

  def results
    @results = Property.where("address ILIKE ?", "%#{params[:query]}%")
  end

end
