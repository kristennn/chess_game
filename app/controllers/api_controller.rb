class ApiController < ApplicationController
  protect_from_forgery :except => :index

end
