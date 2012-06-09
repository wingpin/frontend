Frontend::Application.routes.draw do
  root :to => 'root#index'
  resource :iteneraries
end
