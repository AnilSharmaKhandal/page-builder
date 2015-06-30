class HomesController < ApplicationController
  before_action :login_again_if_different_shop
  around_filter :shopify_session  
  
  def index      
  end

  def new
  	@home = Home.new
    @pages = ShopifyAPI::Page.find(:all)    
  end
 
  def create    
    if params[:page_id] == "null"
      flash[:alert] = 'Please select a page.'
      redirect_to root_path
    else  
      @page_dt = ShopifyAPI::Page.find(params[:page_id])    
      @page_dt.body_html = params[:home][:content]  
      @page_dt.save

      shopId = @page_dt.shop_id
      pageId = params[:page_id]

      @check_page = Home.find_by(:page_id => pageId)
      
      if @check_page.present?
        @check_page.update_attributes(:content => params[:home][:content])
        flash[:notice] = 'Successfully Updated.'
        redirect_to root_path
      else
      	@home = Home.new(page_params)
        @home.store_id = shopId
        @home.page_id = pageId
        if @home.save 
          flash[:notice] = 'Successfully Saved.'   
          redirect_to root_path
        else
          @pages = ShopifyAPI::Page.find(:all, :params => {:limit => 10})
          render :new
        end
      end
    end
  end

  private
  def page_params
    params.require(:home).permit(:content)
  end
end
                    