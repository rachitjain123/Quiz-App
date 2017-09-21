Rails.application.routes.draw do
  post '/save', to: 'quiz#save'
  get '/display_responses', to: 'quiz#display_responses'

  get '/display_the_leaderboard', to: 'quiz#display_the_leaderboard'
   get '/view_the_genre1_leaderboard', to: 'quiz#view_the_genre1_leaderboard'
    get '/view_the_genre2_leaderboard', to: 'quiz#view_the_genre2_leaderboard'
  get '/quiz/:id/view_the_leaderboard', to:'quiz#view_the_leaderboard'

  get  '/quizcreate',  to: 'quiz#new'


  get  '/static_pages/index/:id',  to: 'static_pages#index'


  post '/quizcreate',  to: 'quiz#create'



  get 'add_question/:id', to: 'quiz#add_question'
  post 'add_question', to: 'quiz#create_question'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help' 
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  patch '/users/:id/edit', to:'users#edit'
  patch '/quiz/:id/edit', to:'quiz#edit'

  delete '/quiz/:id', to: 'quiz#destroy'
 
  resources :users
  resources :quiz
end