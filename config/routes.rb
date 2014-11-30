Rails.application.routes.draw do

  get  "/searches",       to: "searches#index",       as: :searches
  post "/searches",       to: "searches#results"

  get  "/properties",     to: "properties#index",     as: :properties
  get  "/properties/:id", to: "properties#show",      as: :property

  root "welcome#index"
end
