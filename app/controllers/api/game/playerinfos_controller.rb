class Api::Game::PlayerinfosController < ApiController

  def search_player
    render :json => {
      :players => [{
        :uid => 1,
        :name => "啦啦啦",
        :gold => 288,
        :online => true,
        :sex => 1,
        :viptype => 1,
        :headimgurl => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg",
        :score => 1234,
        :diamond => 2000
      },
      {:uid => 2,
      :name => "啦啦啦",
      :gold => 288,
      :online => true,
      :sex => 1,
      :viptype => 1,
      :headimgurl => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg",
      :score => 1234,
      :diamond => 2000
    }],
      :msg => "已搜索到好友",
      :code => 0
    }
  end

  def destroy_player
    render :json => {
      :msg => "删除好友成功",
      :code => 1
    }
  end

  def add_player
    render :json => {
      :msg => "添加好友成功",
      :code => 2
    }
  end

  def search_request
    render :json => {
      :players => [{
        :uid => 1,
        :name => "啦啦啦",
        :gold => 288,
        :online => true,
        :sex => 1,
        :viptype => 1,
        :headimgurl => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg",
        :score => 1234,
        :diamond => 2000
      },
      {:uid => 2,
      :name => "啦啦啦",
      :gold => 288,
      :online => true,
      :sex => 1,
      :viptype => 1,
      :headimgurl => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg",
      :score => 1234,
      :diamond => 2000
    }],
      :msg => "已搜索到请求列表",
      :code => 0
    }
  end

  def deal_request
    @agree = params[:agree]
    if @agree
      render :json => {
        :msg => "已同意好友申请",
        :code => 0
      }
    else
      render :json => {
        :msg => "已拒绝好友申请",
        :code => 1
      }
    end
  end

  def add_target_player
    @player = TblPlayerinfo.find_by_userid!(params[:userid])
    @target = TblPlayerinfo.find_by_userid!(params[:targetPlayers])
    render :json => {
      :msg => "配对成功，已添加该好友",
      :code => 0
    }
  end

  def get_phone_list
    render :json => {
      :players => [{
        :uid => 1,
        :name => "啦啦啦",
        :gold => 288,
        :online => true,
        :sex => 1,
        :viptype => 1,
        :headimgurl => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg",
        :score => 1234,
        :diamond => 2000
      },
      {:uid => 2,
      :name => "啦啦啦",
      :gold => 288,
      :online => true,
      :sex => 1,
      :viptype => 1,
      :headimgurl => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg",
      :score => 1234,
      :diamond => 2000
    }],
      :msg => "已搜索到通讯录好友",
      :code => 0
    }
  end

  def create_group
    render :json => {
      :msg => "成功创建圈子",
      :code => 7,
      :group => {
        :id => 1,
        :description => "这是第一个圈子",
        :name => "啦啦啦的圈子",
        :count => 1,
        :pics => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg"
      }
    }
  end

  def search_group
    render :json => {
      :msg => "成功搜索到圈子",
      :code => 8,
      :group => {
        :id => 1,
        :description => "这是第一个圈子",
        :name => "啦啦啦的圈子",
        :count => 1,
        :pics => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg"
      }
    }
  end

  def search_grouplist
    render :json => {
      :msg => "已查询到圈子列表",
      :code => 9,
      :group => {
        :id => 1,
        :description => "这是第一个圈子",
        :name => "啦啦啦的圈子",
        :count => 1,
        :pics => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg"
      }
    }
  end

  def join_group
    render :json => {
      :msg => "已加入到本圈子",
      :code => 10
    }
  end

  def get_groupinfo
    render :json => {
      :msg => "已找到您要查询的圈子",
      :code => 11,
      :group => {
        :id => 1,
        :description => "这是第一个圈子",
        :name => "啦啦啦的圈子",
        :count => 1,
        :pics => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg"
      }
    }
  end

  def get_group_player
    render :json => {
      :msg => "已查询到本圈子成员",
      :code => 0,
      :players => [{
        :uid => 1,
        :name => "啦啦啦",
        :gold => 288,
        :online => true,
        :sex => 1,
        :viptype => 1,
        :headimgurl => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg",
        :score => 1234,
        :diamond => 2000
      },
      {:uid => 2,
      :name => "啦啦啦",
      :gold => 288,
      :online => true,
      :sex => 1,
      :viptype => 1,
      :headimgurl => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg",
      :score => 1234,
      :diamond => 2000
    }],
    }
  end

  def delete_group_player
    render :json => {
      :msg => "已删除圈内成员",
      :code => 0
    }
  end

  def quit_group
    render :json => {
      :msg => "已退出本圈子",
      :code => 0
    }
  end

  def disband_group
    render :json => {
      :msg => "已解散本圈子",
      :code => 0
    }
  end

  def search_groupRequest
    render :json => {
      :message => "已查询到圈子申请列表",
      :code => 0,
      :players => [{
        :uid => 1,
        :name => "啦啦啦",
        :gold => 288,
        :online => true,
        :sex => 1,
        :viptype => 1,
        :headimgurl => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg",
        :score => 1234,
        :diamond => 2000
      },
      {:uid => 2,
      :name => "啦啦啦",
      :gold => 288,
      :online => true,
      :sex => 1,
      :viptype => 1,
      :headimgurl => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg",
      :score => 1234,
      :diamond => 2000
    }],
    }
  end

  def search_quit_request
    render :json => {
      :message => "已查询到圈子的退圈记录",
      :code => 0,
      :players => [{
        :uid => 1,
        :name => "啦啦啦",
        :gold => 288,
        :online => true,
        :sex => 1,
        :viptype => 1,
        :headimgurl => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg",
        :score => 1234,
        :diamond => 2000
      },
      {:uid => 2,
      :name => "啦啦啦",
      :gold => 288,
      :online => true,
      :sex => 1,
      :viptype => 1,
      :headimgurl => "https://gss0.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/562c11dfa9ec8a132d6bb732f003918fa1ecc0eb.jpg",
      :score => 1234,
      :diamond => 2000
    }],
    }
  end

end
