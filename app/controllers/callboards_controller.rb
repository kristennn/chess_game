class CallboardsController < ApplicationController
  before_action :find_callboard, only: [:show, :destroy]

  def index
    @callboards = Callboard.all
  end

  def new
    @callboard = Callboard.new
  end

  def create
    @callboard = Callboard.new(callboard_params)
    if @callboard.save
       redirect_to callboards_path
     else
       render "new"
    end
  end

  def show
  end

  def destroy
    @callboard.destroy
    redirect_to callboards_path
  end

  def find_callboard
    @callboard = Callboard.find(params[:id])
  end



  private

  def callboard_params
    params.require(:callboard).permit(:title, :post)
  end
end
