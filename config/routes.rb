Rails.application.routes.draw do
  root to: 'chronology#index'
  get '/timeline', to: 'chronology#timeline'
end
