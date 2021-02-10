#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                              accounts GET    /accounts(.:format)                                                                      accounts#index
#                                       POST   /accounts(.:format)                                                                      accounts#create
#                           new_account GET    /accounts/new(.:format)                                                                  accounts#new
#                          edit_account GET    /accounts/:id/edit(.:format)                                                             accounts#edit
#                               account GET    /accounts/:id(.:format)                                                                  accounts#show
#                                       PATCH  /accounts/:id(.:format)                                                                  accounts#update
#                                       PUT    /accounts/:id(.:format)                                                                  accounts#update
#                                       DELETE /accounts/:id(.:format)                                                                  accounts#destroy
#                         facade_stocks GET    /facades/:facade_id/stocks(.:format)                                                     stocks#index
#                                       POST   /facades/:facade_id/stocks(.:format)                                                     stocks#create
#                      new_facade_stock GET    /facades/:facade_id/stocks/new(.:format)                                                 stocks#new
#                     edit_facade_stock GET    /facades/:facade_id/stocks/:id/edit(.:format)                                            stocks#edit
#                          facade_stock GET    /facades/:facade_id/stocks/:id(.:format)                                                 stocks#show
#                                       PATCH  /facades/:facade_id/stocks/:id(.:format)                                                 stocks#update
#                                       PUT    /facades/:facade_id/stocks/:id(.:format)                                                 stocks#update
#                                       DELETE /facades/:facade_id/stocks/:id(.:format)                                                 stocks#destroy
#                      facade_dividends GET    /facades/:facade_id/dividends(.:format)                                                  dividends#index
#                                       POST   /facades/:facade_id/dividends(.:format)                                                  dividends#create
#                   new_facade_dividend GET    /facades/:facade_id/dividends/new(.:format)                                              dividends#new
#                  edit_facade_dividend GET    /facades/:facade_id/dividends/:id/edit(.:format)                                         dividends#edit
#                       facade_dividend GET    /facades/:facade_id/dividends/:id(.:format)                                              dividends#show
#                                       PATCH  /facades/:facade_id/dividends/:id(.:format)                                              dividends#update
#                                       PUT    /facades/:facade_id/dividends/:id(.:format)                                              dividends#update
#                                       DELETE /facades/:facade_id/dividends/:id(.:format)                                              dividends#destroy
#                         facade_values GET    /facades/:facade_id/values(.:format)                                                     values#index
#                                       POST   /facades/:facade_id/values(.:format)                                                     values#create
#                      new_facade_value GET    /facades/:facade_id/values/new(.:format)                                                 values#new
#                     edit_facade_value GET    /facades/:facade_id/values/:id/edit(.:format)                                            values#edit
#                          facade_value GET    /facades/:facade_id/values/:id(.:format)                                                 values#show
#                                       PATCH  /facades/:facade_id/values/:id(.:format)                                                 values#update
#                                       PUT    /facades/:facade_id/values/:id(.:format)                                                 values#update
#                                       DELETE /facades/:facade_id/values/:id(.:format)                                                 values#destroy
#                               facades GET    /facades(.:format)                                                                       facades#index
#                                       POST   /facades(.:format)                                                                       facades#create
#                            new_facade GET    /facades/new(.:format)                                                                   facades#new
#                           edit_facade GET    /facades/:id/edit(.:format)                                                              facades#edit
#                                facade GET    /facades/:id(.:format)                                                                   facades#show
#                                       PATCH  /facades/:id(.:format)                                                                   facades#update
#                                       PUT    /facades/:id(.:format)                                                                   facades#update
#                                       DELETE /facades/:id(.:format)                                                                   facades#destroy
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  root 'facades#main'

  resources :accounts  do
      resources :balances
  end
  resources :facades do
    resources :stocks
    resources :dividends
    resources :values
  end
  resources :charts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
