class SearchesController < ApplicationController

  def index
    query = params[:query]
    unless @results = Property.where("address ILIKE ? OR parcel_number = ? OR year_built = ?", "%#{query}%", "#{query}", "#{query}")
      @results = []
    end

    # if params[:address]
    #   @results = Property.where("address ILIKE ?", "%#{params[:address]}%")
    # elsif params[:parcel]
    #   @results = Property.where("parcel_number ILIKE ?", "%#{params[:parcel]}%")
    # elsif params[:year]
    #   @results = Property.where("year_built ILIKE ?", "%#{params[:year]}%")
    # else
    #   @results = []
    # end
  end

end
