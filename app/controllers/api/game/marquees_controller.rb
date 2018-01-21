class Api::Game::MarqueesController < ApiController
  def get_paomatiao
    @tbl_account = TblAccount.find_by_userid(params[:uid])
    @marquees = Marquee.all    
  end
end
