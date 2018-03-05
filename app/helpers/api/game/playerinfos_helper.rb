module Api::Game::PlayerinfosHelper
  def render_online_status(player)
    if player.account.login_time > player.account.logout_time
      true
    else
      false
    end
  end

  def render_location(player)
    player.location.present? ? player.location.gsub(/\p{Han}+/u).first : "未设置地址信息"
  end

end
