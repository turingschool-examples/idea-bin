Rails.application.routes.draw do
  root 'ideas#index'
  resources :ideas

  mount MagicLamp::Genie, at: '/magic_lamp' if defined?(MagicLamp)
end
