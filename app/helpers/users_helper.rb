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

# 二级代理算法
  def render_salertwo_order(user)
    sum = 0
    if user.permission == "三级代理"
      sum = (render_total_order(user) * user.rate)
    else
      $u = User.where(:salerid => user.id )
      $u.each do |i|
        sum += (render_total_order(i) * (user.rate - i.rate))
      end
    end
    sum += render_total_order(user) * user.rate
    sum
  end

end
