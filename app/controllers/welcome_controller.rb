class WelcomeController < ApplicationController
  layout 'admin'
  def index
    flash[:notice] = "你好"
  end
end
