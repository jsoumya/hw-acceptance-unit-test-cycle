Rottenpotatoes::Application.routes.draw do
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  resources :movies
  
  get 'movies/director/:id', to: 'movies#director', as: 'movies_director'
  post '/movies/search_tmdb'  
  
end