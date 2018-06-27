json.extract! payment, :id, :user_id, :value, :created_at, :updated_at
json.url payment_url(payment, format: :json)
