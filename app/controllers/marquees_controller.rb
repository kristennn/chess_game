class MarqueesController < ApplicationController
  before_action :find_marquee, only: [:edit, :update, :show]

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
  end

  def update
    if @marquee.update(marquee_params)
      redirect_to root_path
      flash[:notice] = "更新成功"
    else
      render "edit"
    end
  end

  def show
  end

  private

    def find_marquee
      @marquee = Marquee.find(params[:id])
    end

    def marquee_params
      params.require(:marquee).permit(:post)
    end
end
