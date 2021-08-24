#                 Prefix Verb   URI Pattern                                                       Controller#Action
#                    root GET    /                                                                stocks#main
#        account_balances GET    /accounts/:account_id/balances(.:format)                         balances#index
#                         POST   /accounts/:account_id/balances(.:format)                         balances#create
#     new_account_balance GET    /accounts/:account_id/balances/new(.:format)                     balances#new
#    edit_account_balance GET    /accounts/:account_id/balances/:id/edit(.:format)                balances#edit
#         account_balance GET    /accounts/:account_id/balances/:id(.:format)                     balances#show
#                         PATCH  /accounts/:account_id/balances/:id(.:format)                     balances#update
#                         PUT    /accounts/:account_id/balances/:id(.:format)                     balances#update
#                         DELETE /accounts/:account_id/balances/:id(.:format)                     balances#destroy
#                accounts GET    /accounts(.:format)                                              accounts#index
#                         POST   /accounts(.:format)                                              accounts#create
#             new_account GET    /accounts/new(.:format)                                          accounts#new
#            edit_account GET    /accounts/:id/edit(.:format)                                     accounts#edit
#                 account GET    /accounts/:id(.:format)                                          accounts#show
#                         PATCH  /accounts/:id(.:format)                                          accounts#update
#                         PUT    /accounts/:id(.:format)                                          accounts#update
#                         DELETE /accounts/:id(.:format)                                          accounts#destroy
#          stock_dividend DELETE /stocks/:stock_id/dividends/:id(.:format)                        dividends#destroy
#        edit_stock_value GET    /stocks/:stock_id/values/:id/edit(.:format)                      values#edit
#             stock_value PATCH  /stocks/:stock_id/values/:id(.:format)                           values#update
#                         PUT    /stocks/:stock_id/values/:id(.:format)                           values#update
#                         DELETE /stocks/:stock_id/values/:id(.:format)                           values#destroy
#                  stocks GET    /stocks(.:format)                                                stocks#index
#                         POST   /stocks(.:format)                                                stocks#create
#               new_stock GET    /stocks/new(.:format)                                            stocks#new
#              edit_stock GET    /stocks/:id/edit(.:format)                                       stocks#edit
#                   stock GET    /stocks/:id(.:format)                                            stocks#show
#                         PATCH  /stocks/:id(.:format)                                            stocks#update
#                         PUT    /stocks/:id(.:format)                                            stocks#update
#                         DELETE /stocks/:id(.:format)                                            stocks#destroy
#                  quotes GET    /quotes(.:format)                                                quotes#index
#                         POST   /quotes(.:format)                                                quotes#create
#               new_quote GET    /quotes/new(.:format)                                            quotes#new
#              edit_quote GET    /quotes/:id/edit(.:format)                                       quotes#edit
#                   quote GET    /quotes/:id(.:format)                                            quotes#show
#                         PATCH  /quotes/:id(.:format)                                            quotes#update
#                         PUT    /quotes/:id(.:format)                                            quotes#update
#                         DELETE /quotes/:id(.:format)                                            quotes#destroy
#               dividends GET    /dividends(.:format)                                             dividends#index
#                         POST   /dividends(.:format)                                             dividends#create
#            new_dividend GET    /dividends/new(.:format)                                         dividends#new
#           edit_dividend GET    /dividends/:id/edit(.:format)                                    dividends#edit
#                dividend GET    /dividends/:id(.:format)                                         dividends#show
#                         PATCH  /dividends/:id(.:format)                                         dividends#update
#                         PUT    /dividends/:id(.:format)                                         dividends#update
#                  values GET    /values(.:format)                                                values#index
#                         POST   /values(.:format)                                                values#create
#               new_value GET    /values/new(.:format)                                            values#new
#                   value GET    /values/:id(.:format)                                            values#show
#                  charts GET    /charts(.:format)                                                charts#index
#                         POST   /charts(.:format)                                                charts#create
#               new_chart GET    /charts/new(.:format)                                            charts#new
#              edit_chart GET    /charts/:id/edit(.:format)                                       charts#edit
#                   chart GET    /charts/:id(.:format)                                            charts#show
#                         PATCH  /charts/:id(.:format)                                            charts#update
#                         PUT    /charts/:id(.:format)                                            charts#update
#                         DELETE /charts/:id(.:format)                                            charts#destroy

Rails.application.routes.draw do
  root 'stocks#main'

  resources :accounts do
    get '/summary', to: 'accounts#summary'
    resources :balances, only: %i[edit destroy]
  end
  resources :stocks do
    get '/summary', to: 'stocks#summary'
    resources :dividends, only: [:destroy]
    resources :values, only: %i[edit destroy]
  end

  resources :quotes

  resources :dividends, except: [:destroy]

  resources :values, except: %i[edit destroy]

  resources :charts, only: %i[index]

  resources :balances, except: %i[edit destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
