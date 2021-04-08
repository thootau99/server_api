Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get '/new' => 'interface#new'
      get '/quit' => 'interface#quit'
      get '/all' => 'interface#all'
      get '/find' => 'interface#find'
      post '/change' => 'interface#change'
    end
  end
end
