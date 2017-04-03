Rails.application.routes.draw do
  resources :notes
  
  # get '/notes/index' => 'notes#index'
  
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :like_notes
    end
  end

  resources :notes, only: [:show, :create, :edit, :update, :destroy] do
    member do
      get :liking_users
    end
  end

  post '/like/:note_id' => 'likes#like', as: 'like'
  delete '/unlike/:note_id' => 'likes#unlike', as: 'unlike'
  

  
  root 'home#top'
  get '/about' => 'home#about'
  
  resources :notes, :proposals do
  collection do
    post :import
  end
end

class CsvExportConstraint
  def self.matches?(request)
    request.params.has_key?(:export_csv)
  end
end

Rails.application.routes.draw do
  # root 'notes#index'

  resources :notes, only: [:index] do
    collection do
      get :index, action: :export_csv, constraints: CsvExportConstraint
      get :index
    end
  end
end

  
  
end