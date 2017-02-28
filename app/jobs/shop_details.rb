shop_url = "https://#{ENV['API_KEY']}:#{ENV['PASSWORD']}@#{ENV['CURRENT_LOGGED_IN_SHOP']}.myshopify.com/admin"
ShopifyAPI::Base.site = shop_url
shop = ShopifyAPI::Shop.current

product_variants = ShopifyAPI::Product.first.variants.count

# Dashing.scheduler.shutdown to get scheduler to stop doing stuff 

# ShopifyAPI::Base.clear_session to get rid of current shop

include DateTimeDiffer



Dashing.scheduler.every '2s' do
  in_business_since = date_time_between(DateTime.now, shop.attributes['created_at'].to_datetime)

  Dashing.send_event('welcome', { title: shop.attributes['name'] })
  Dashing.send_event('welcome', { text: "In business for: " + in_business_since })
end