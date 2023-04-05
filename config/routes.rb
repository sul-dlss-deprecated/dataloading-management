Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, skip: %i[registrations passwords sessions]
  devise_scope :user do
    get "webauth/login" => "login#login", :as => :new_user_session
    get "webauth/logout" => "devise/sessions#destroy",
      :as => :destroy_user_session,
      :via => Devise.mappings[:user].sign_out_via
  end

  resources :vendors, only: [:index, :show]

  root to: "stats#index"

  scope "api" do
    # NOTE: API controller routes go in this block
  end
end
