Rails.application.routes.draw do
  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users

  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"

  root to: "static#home"
  get "/about" => "static#about", as: :about
  get "/contact" => "static#contact", as: :contact
  get "/robots.:format" => "static#robots", as: :robots
  get "/secure" => "static#secure", as: :secure

  get "/forbidden" => "errors#forbidden", as: :forbidden
  get "/internal_server_error" => "errors#internal_server_error", as: :internal_server_error
  get "/not_found" => "errors#not_found", as: :not_found
  match "/404", :to => "errors#not_found", via: :all
  match "/403", :to => "errors#forbidden", via: :all
  match "/500", :to => "errors#internal_server_error", via: :all
end
