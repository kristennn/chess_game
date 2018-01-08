class MarqueesController < ApplicationController

  def index
    @marquees = Marquee.all
  end

  def new
    @marquee = Marquee.new
  end

  def create
    @marquee = Marquee.new(marquee_params)
    if @marquee.save
      redirect_to root_path
      flash[:notice] = "添加成功"
    else
      render "new"
    end
  end

  def edit
    @marquee = Marquee.find(params[:id])
  end

  def update
    @marquee = Marquee.find(params[:id])
    if @marquee.update(marquee_params)
      redirect_to root_path
      flash[:notice] = "更新成功"
    else
      render "edit"
    end
  end

  def show
    @marquee = Marquee.find(params[:id])
  end

  private

    def marquee_params
      params.require(:marquee).permit(:post)
    end
end
