Rozgar::Application.routes.draw do

  resources :admin_users

  resources :loan_payments

  resources :loan_grants

  resources :loan_transactions

  resources :donations

  resources :donners 

 #resources :donner_applicants, :only=>[:new, :create, :destroy]
  resources :guarantors
  resources :applicants
  resources :children, :except=>[:edit, :update, :new]
  resources :expenditures, :except=>[:edit, :update, :new]
  resources :incomes, :except=>[:edit, :update, :new]
  resources :payment_plans, :except=>[:edit, :update, :new]

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
#match '/donors' => 'donners#index'
#match '/donors/:id' => 'donners#show'
#match '/donors/new' => 'donners#new'
#match '/donors/:id/edit' => 'donners#edit'
#match '/donors/create' => 'donners#creat'
#match '/donors/update' => 'donners#update'
#match '/donors/:id/destroy' => 'donners#destroy'

#match '/donors/destroy_applicant/:applicant_id/:donner_id' => 'donners#destroy_applicant'
#match '/donors/create_applicant' => 'donners#create_applicant'


  match 'app_gear/read_csv' => 'app_gear#read_csv'

      match 'donners/destroy_applicant/:applicant_id/:donner_id' => 'donners#destroy_applicant'
      match 'donners/create_applicant' => 'donners#create_applicant'
      match 'tracker/:code' => 'site/tracker#index'
      match 'tracker/' => 'site/tracker#index'
      match 'loan_dispersal/' => 'site/tracker#loan_dispersal'
      match 'tracker/applicants/:id' => 'site/applicants#index'
      match 'admin/' => 'admin_users#login'
      match 'logout' => 'admin_users#logout'
      match '/loan_monthly_payment' => 'loan_monthly_payment#index'
      match 'loan_monthly_payment/update' => 'loan_monthly_payment#update'

          #match 'children/:id' => 'children#index'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
