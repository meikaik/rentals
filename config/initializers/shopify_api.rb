shop_url = "https://#{Figaro.env.API_KEY}:#{Figaro.env.API_PASSWORD}@#{Figaro.env.SHOP_NAME}.myshopify.com/admin"
ShopifyAPI::Base.site = shop_url
