Rails.application.routes.draw do
  get("/", { :controller => "sessions", :action => "new" })
  get("/login", { :controller => "sessions", :action => "new" })
  get("/logout", { :controller => "sessions", :action => "destroy" })
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"
end
