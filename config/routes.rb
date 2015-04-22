Rails.application.routes.draw do
  resources :responders, except: [:new, :edit], defaults: { format: :json }
  resources :emergencies, except: [:new, :edit], defaults: { format: :json }

  get "/*path" => "errors#not_found"
end
