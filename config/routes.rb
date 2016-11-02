Rails.application.routes.draw do

  root 'stagic_pages#home'
  post 'upload' => 'upload#create'

end
