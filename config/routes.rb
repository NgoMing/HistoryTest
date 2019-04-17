Rails.application.routes.draw do
  resources :books, except: [:show] do
    get "history", on: :member
    delete "delete/:author_book_rel_id", on: :member, to: "books#delete_author", as: 'delete_author'
    patch "add", on: :member, to: "books#add_author", as: "add_author"
  end
  resources :authors
end
