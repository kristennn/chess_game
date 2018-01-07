module UsersHelper

# 下线玩家的消费总和
  def render_total_order(user)
    a = user.tbl_accounts
    money = 0
    a.each do |ss|
      ss.tbl_orders.each do |m|
        money += m.money
      end
    end
    money
  end

# 下线代理的代理发展玩家，提成算法
  def render_saler_order(user)
    sum = 0
    @salertwo = User.where(:salerid => user.id)
    result = []
      @salertwo.each do |b|
        c = User.where(:salerid => b.id)
        result += c
      end
    @salerthree = result

    @salerthree.each do |d|
      r = User.find_by(:id => d.salerid)
      sum += (render_total_order(d) * (user.rate - r.rate))
    end
    sum.round
  end

# 最终的提成总额
  def render_order(user)
    sum = 0
    if user.permission == "三级代理"
      sum = (render_total_order(user) * user.rate)
    else
      $u = User.where(:salerid => user.id)
      $u.each do |i|
        sum += (render_total_order(i) * (user.rate - i.rate))
      end
    end
    sum = sum + render_total_order(user) * user.rate + render_saler_order(user)
    sum.round
  end

end
