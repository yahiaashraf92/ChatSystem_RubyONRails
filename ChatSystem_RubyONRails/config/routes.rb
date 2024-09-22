Rails.application.routes.draw do
  # get "/applications/:name", to: "applications#get_token_by_name"

  get "search", to: "search#search"

  resources :applications, param: :token do
    resources :chats, param: :number do
      resources :messages, param: :content
    end
  end
end
