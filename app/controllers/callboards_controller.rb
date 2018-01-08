class CallboardsController < ApplicationController

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
    @callboard = Callboard.find(params[:id])
  end

  def destroy
    @callboard = Callboard.find(params[:id])
    @callboard.destroy
    redirect_to callboards_path
  end



  private

  def callboard_params
    params.require(:callboard).permit(:title, :post)
  end
end
