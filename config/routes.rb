Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  #resources :tutors
    #

  get '/approve/:id', to: 'sessions#approve', as: 'approve'
  get '/reject/:id', to: 'sessions#reject', as: 'reject'

  resources :students
  resources :accounts do
    member do
      get 'logout'
      get 'makereviewer'
      get 'revokereviewer'
    end
  end
  resources :tutors do
    member do
      get 'withdraw'
    end
  end
  resources :subjects
  resources :orders
  resources :tutor_requests do
    member do
      get 'tutor_approve'
    end
  end

  get '/orders/', to: 'orders#index'
  post '/orders/submit', to: 'orders#submit'

  post 'orders/paypal/create_payment'  => 'orders#paypal_create_payment', as: :paypal_create_payment
  post 'orders/paypal/execute_payment'  => 'orders#paypal_execute_payment', as: :paypal_execute_payment

  Rails.application.routes.draw do
      resources :subject do
	  resources :tutors do
	      resources :reviews
	  end
      end
  end
  root to: 'pages#home'
  get 'login', to: 'pages#login'
  post 'login', to: 'pages#login_post'
  #resources :subjects
  Rails.application.routes.draw do
    resources :subject do
	    resources :tutors do
	      resources :sessions
	    end
    end

    resources :conversations, only: [:create] do
      member do
        post :close
      end
      resources :messages, only: [:create]
    end
  end

  #Rails.application.routes.draw do
   #   resources :tutors do
#	  resources :review
 #     end
  #end
  
  #Rails.application.routes.draw do
   # resources :tutors do
    #  resources :reviews
    #end
  #end

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
