class Api::Game::CallboardsController < ApiController
  
  def get_news
    @player = TblPlayerinfo.find_by_userid(params[:uid])
    @callboards = Callboard.all
  end

end
