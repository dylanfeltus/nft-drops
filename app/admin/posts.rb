ActiveAdmin.register Post do
  permit_params :content, :sent_at, :scheduled_for
end
