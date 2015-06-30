class SessionsController < ApplicationController
  include ShopifyApp::SessionsController

  def callback
  	super
  	session[:shop] = params[:shop]
  end
end
