Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :merchant, only: [:show] do
    resources :dashboard, only: [:index]
    resources :items, except: [:destroy]
    resources :item_status, only: [:update]
    resources :invoices, only: [:index, :show, :update]
    resources :discounts, only: [:index, :show, :new, :create, :edit]
  end

  delete '/merchant/:id/discounts', to: 'discounts#destroy'
  patch '/merchant/:merchant_id/discounts/:bulk_discount_id', to: 'discounts#update'
  
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :merchants, except: [:destroy]
    resources :merchant_status, only: [:update]
    resources :invoices, except: [:new, :destroy]
  end
end
