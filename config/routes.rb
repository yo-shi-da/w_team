Rails.application.routes.draw do
  root 'statics#top'
  get :dashboard, to: 'teams#dashboard'

  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resource :user

  post 'team/authority', to: 'teams#authority_change'
  
  resources :teams do
    # get :authority, action: :authority_change
    resources :assigns, only: %w(create destroy)
    resources :agendas, shallow: true do
      resources :articles do
        resources :comments
      end
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
