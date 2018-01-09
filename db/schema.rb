# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180108110420) do

  create_table "callboards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "friendly_id"
    t.index ["friendly_id"], name: "index_callboards_on_friendly_id", unique: true
  end

  create_table "marquees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "friendly_id"
    t.index ["friendly_id"], name: "index_marquees_on_friendly_id", unique: true
  end

  create_table "phone_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "token"
    t.string "phone"
    t.datetime "expired_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone", "token"], name: "index_phone_tokens_on_phone_and_token"
  end

  create_table "tbl_account", primary_key: "userid", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "用户账号表" do |t|
    t.string "account", default: "", null: false, comment: "昵称"
    t.string "pwd", default: "", null: false, comment: "密码"
    t.string "channel", limit: 10, default: "", null: false, comment: "渠道"
    t.string "app_channel", limit: 8, default: "3501", null: false
    t.datetime "lock", default: "1970-01-01 00:00:00", null: false, comment: "封号时间"
    t.datetime "login_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "登陆时间"
    t.datetime "logout_time", default: "1970-01-01 00:00:00", null: false, comment: "登出时间"
    t.datetime "create_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "创建时间"
    t.string "token", default: "", null: false, comment: "token"
    t.datetime "token_invalid_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "token失效时间"
    t.string "platform", limit: 16, default: "", null: false, comment: "注册终端"
    t.string "ip", limit: 16, default: "", null: false, comment: "最近一次登陆的ip地址"
    t.integer "vip_type", limit: 1, default: 0, null: false
    t.datetime "vip_invalid_time", default: "1970-01-01 00:00:00", null: false
    t.string "phone_num", limit: 20
    t.integer "saler"
    t.index ["channel", "account"], name: "auth", unique: true
  end

  create_table "tbl_order", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "userid", default: 0, null: false, comment: "用户ID"
    t.string "goods_id", limit: 32, default: "", null: false, comment: "商品ID"
    t.string "channel", limit: 8, default: "", null: false, comment: "支付渠道。alipay，支付宝；weixin，微信；apple，苹果"
    t.string "order_id", default: "", null: false, comment: "第三方订单号"
    t.integer "money", default: 0, null: false, comment: "实际支付人民币"
    t.integer "state", default: 1, null: false, comment: "状态。1，下单；2，支付成功；3，发送金币完成；4，失效；"
    t.datetime "create_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "创建订单时间"
    t.datetime "invalid_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "失效时间"
    t.datetime "pay_time", null: false, comment: "支付成功时间"
    t.datetime "complete_time", null: false, comment: "完成时间"
    t.index ["channel"], name: "index_channel"
    t.index ["create_time"], name: "index_create_time"
    t.index ["userid"], name: "userid", comment: "用户ID"
  end

  create_table "tbl_player_fee", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "userid", null: false
    t.integer "table_id", null: false
    t.integer "fee", null: false
    t.datetime "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新时间"
  end

  create_table "tbl_playerinfo", primary_key: "userid", id: :bigint, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT", comment: "用户数据表" do |t|
    t.string "nickname", limit: 128, default: "", null: false, comment: "昵称"
    t.string "second_pwd", default: "", null: false, comment: "保险箱密码"
    t.integer "sex", limit: 1, default: 1, null: false, comment: "性别。1-female；2-male"
    t.bigint "gold", default: 0, null: false
    t.bigint "bank_gold", default: 0, null: false
    t.bigint "honor", default: 0, null: false
    t.datetime "create_time", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "创建时间"
    t.datetime "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "更新时间"
    t.integer "diamond", default: 2000
    t.string "headimg"
    t.index ["nickname"], name: "nickname", unique: true
  end

  create_table "tbl_room", primary_key: ["table_id", "table_code"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "table_id", null: false
    t.string "table_code", limit: 6, null: false
    t.datetime "time", default: -> { "CURRENT_TIMESTAMP" }
    t.string "players", limit: 45, null: false
    t.integer "mode", null: false
    t.integer "seat_cnt", null: false
    t.integer "fee", null: false
    t.datetime "end_time", null: false
  end

  create_table "user_profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "avatar", comment: "头像"
    t.string "name", comment: "姓名"
    t.string "phone", comment: "手机"
    t.string "email", comment: "邮箱"
    t.string "province", comment: "省份"
    t.string "city", comment: "城市"
    t.string "address", comment: "地址"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "permission"
    t.integer "salerid"
    t.string "remember_digest"
    t.integer "diamond", default: 2000
    t.integer "count"
    t.float "rate", limit: 24
    t.string "wechat_unionid", comment: "微信用户的UnionID"
    t.integer "share_diamond"
    t.index ["wechat_unionid"], name: "index_users_on_wechat_unionid", unique: true
  end

  add_foreign_key "user_profiles", "users"
end
