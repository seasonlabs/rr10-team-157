Linkodrama::Application.routes.draw do
  root :to => "index#index"
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'
  
  match '/sessions/destroy', :to => 'sessions#destroy'
  
  match 'links', :to => 'links#index'
  match 'links/process_short_url/:id', :to => 'links#process_short_url'
  match 'links/get_page_title/:id', :to => 'links#get_page_title'
  match 'links/refresh', :to => 'links#refresh'
end
