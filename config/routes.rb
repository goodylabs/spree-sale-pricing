Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :sale_prices do
        get "disable_sale"
        post "enable_sale"
    end
  end
end