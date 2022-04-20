ActiveAdmin.register Subscriber do
  permit_params :wallet, :transaction_hash, :webhook_url, :expires_at, :active
end
