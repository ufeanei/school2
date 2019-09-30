Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/home" => "pages#hello"
  get "/webdesign" => "pages#webdesign"

  get "/android"  => "pages#android"
  get "/laravel"  => "pages#laravel"
  get "/nodecourse"  => "pages#nodecourse"
  get "/diploma"  => "pages#diploma"
  get "/hnd"   => "pages#hnd"
   
  get "rail" => "pages#rail"
  get "/bscweb"   => "pages#bscweb"
  get "/graphics"   => "pages#graphics"
  get "/bscmobile"   => "pages#bscmobile"
   
  get "/bscsoftware"  => "pages#bscsoftware"
  get "/bsccsna"  => "pages#bsccsna"
  get "/bscce" => "pages#bscce"
  get "/bscgmm" => "pages#bscgmm"
  get "/bscccbd" => "pages#bscccbd"
  get "/bscsecure" => "pages#bscsecure"
  resources :users , except: [:update, :destroy]


  root 'pages#hello'
end
