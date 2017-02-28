class SessionStorage
  def self.store(session)
    shop = Shop.find_or_initialize_by(shopify_domain: session.url)
    shop.shopify_token = session.token
    shop.save!
    shop.id

    shop_url = "https://#{ENV['API_KEY']}:#{ENV['PASSWORD']}@#{ENV['CURRENT_LOGGED_IN_SHOP']}.myshopify.com/admin"
    ShopifyAPI::Base.site = shop_url
    shop = ShopifyAPI::Shop.current
    
  end

  def self.retrieve(id)
    return unless id
    shop = Shop.find(id)
    ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
  rescue ActiveRecord::RecordNotFound
    nil
  end
end