json.extract! user, :id, :email, :gender, :username, :created_at, :updated_at
json.url user_url(user, format: :json)
