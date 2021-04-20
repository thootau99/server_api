Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get '/new' => 'interface#new'
      get '/quit' => 'interface#quit'
      get '/all' => 'interface#all'
      get '/find' => 'interface#find'
      get '/exit' => 'interface#exit'
      get '/pause' => 'interface#pause'
      get '/play' => 'interface#play'
      post '/change' => 'interface#change'
      post '/dialog/create' => 'dialog_checker#create'
      get '/dialog/deleteall' => 'dialog_checker#deleteAll'
      get '/dialog/get' => 'dialog_checker#get'
      get '/dialog/off' => 'dialog_checker#off'
      get '/dialog/getimage' => 'dialog_checker#getImage'
      get '/action/create' => 'action#create'
      get '/action/get' => 'action#get'
      get '/action/off' => 'action#off'
      get '/action/destroy' => 'action#destroy'
    end
  end
end
