# class Shop < ActiveRecord::Base
#   include ShopifyApp::Shop
# end

class Shop < ActiveRecord::Base

  validates :shopify_domain, uniqueness: true
  has_many :home
  

  def self.store(session)
    my_shop = self.where(shopify_domain: session.url, shopify_token: session.token).first
    if my_shop.present?
      return my_shop.id
    else
      shop = self.new(shopify_domain: session.url, shopify_token: session.token)
      shop.save  
      shop.id
    end
   end

  def self.retrieve(id)
    if shop = self.where(id: id).first
    ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
    end
  end
end
