
Rails.application.routes.draw do


  patch 'admin/contacto' => 'c4/admin#contact'
  get 'admin/contacto' => 'c4/admin#contact', as: 'contact'

  resources :materials, path: 'admin/materials', except: :show, path_names: { new: 'nuevo', edit: 'editar' }, module: 'c4'

  resources :announcements, path: 'admin/announcements', except: :show, path_names: { new: 'nuevo', edit: 'editar' }, module: 'c4'

  mount C4::Engine => "/admin"

  root 'static_pages#landing'

  post '/enviar_contacto' => 'static_pages#enviar_contacto', as: 'enviar_contacto'

  get 'como-funciona' => 'static_pages#envianos', as: 'envianos'

  get 'enviar-diseno' => 'static_pages#fabnami', as: 'fabnami'

  get 'para-ti' => 'static_pages#parati', as: 'parati'

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
