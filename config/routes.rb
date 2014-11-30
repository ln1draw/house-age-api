Rails.application.routes.draw do

  defaults format: :json do
    get  "/searches",       to: "searches#index"

    get  "/properties",     to: "properties#index",       as: :properties
    get  "/properties/:id", to: "properties#show",        as: :property
  end

  root "welcome#index"
end
