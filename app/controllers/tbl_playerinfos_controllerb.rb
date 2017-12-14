class TblPlayerinfosController < ApplicationController
  layout 'admin'

  def edit
    @tbl_playerinfo = TblPlayerinfo.find_by(params[:userid])
  end

  def update
    @tbl_playerinfo = TblPlayerinfo.find_by(params[:userid])
    if @tbl_playerinfo.update(tbl_playerinfo_params)
      flash[:notice] = "转账成功"
      redirect_to player_info_path
    end
  end

  def add_diamond
    @tbl_playerinfo = TblPlayerinfo.find_by(params[:userid])
    if @tbl_playerinfo.update(tbl_playerinfo_params)
      flash[:notice] = "转账成功"
      redirect_to player_info_path
    end
  end

  private

  def tbl_playerinfo_params
    params.require(:tbl_playerinfo).permit(:nickname, :second_pwd, :gold, :bank_gold, :honor, :diamond)
  end
end
