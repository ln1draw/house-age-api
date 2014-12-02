class SearchesController < ApplicationController

  def index
    if params[:address]
      @results = Property.where("address ILIKE ?", "%#{params[:address]}%")
    elsif params[:parcel]
      @results = Property.where("parcel_number ILIKE ?", "%#{params[:parcel]}%")
    elsif params[:year]
      @results = Property.where("year_built ILIKE ?", "%#{params[:year]}%")
    else
      @results = []
    end
  end

end
