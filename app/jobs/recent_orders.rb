
Dashing.scheduler.every '2s' do
  number_of_orders = ShopifyAPI::Product.find(:all, params: {created_at_min: (Time.now - 7.days), limit: 250}).count

  Dashing.send_event('orders', { text: "#{number_of_orders}" })
end