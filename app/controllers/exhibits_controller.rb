class ExhibitsController < ApplicationController
  def index
    @exhibits = Exhibit.includes(:user)
  end



  def show
    @exhibit = Exhibit.find(params[:id])
  end

end
