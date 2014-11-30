class SearchesController < ApplicationController

  def index

  end

  def results
    @results = Property.where("address ILIKE ?", "%#{params[:query]}%")
  end

end
