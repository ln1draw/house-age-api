Rails.application.routes.draw do

  get  "/searches",      to: "searches#index",      as: :searches
  post "/searches",      to: "searches#results"

  root "welcome#index"
end
