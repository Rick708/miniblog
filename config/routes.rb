Rails.application.routes.draw do
  devise_for :users
  root to: 'blogs#index'
  get   'tweets'      =>  'blogs#index'     #ツイート一覧画面
  get   'tweets/new'  =>  'blogs#new'       #ツイート投稿画面
  post  'tweets'      =>  'blogs#create'    #ツイート投稿機能
  delete  'tweets/:id'  => 'blogs#destroy'  #ツイート削除機能
  get   'tweets/:id/edit'  => 'blogs#edit'  #ツイート編集機能
  patch   'tweets/:id'  => 'blogs#update'  #ツイート更新画面
end