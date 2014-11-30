Rails.application.routes.draw do

  get  "/searches",       to: "searches#index",       as: :searches

  defaults format: :json do
    post "/searches",       to: "searches#results"

    get  "/properties",     to: "properties#index",     as: :properties
    get  "/properties/:id", to: "properties#show",      as: :property
  end

  root "welcome#index"
end
