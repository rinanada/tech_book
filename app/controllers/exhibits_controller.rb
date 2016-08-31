class ExhibitsController < ApplicationController
  def index
    @user_detail = UserDetail.find(1)
    @mastname = @user_detail.try(:firstname) || '名無し'
    @mastname += @user_detail.try(:lastname) || '名無し'
    @exhibits = Exhibit.includes(:user)
  end



  def show
    @exhibit = Exhibit.find(params[:id])
  end

end

