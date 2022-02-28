json.extract! movie, :id, :name, :lengt, :release_dt, :synopsis, :created_at, :updated_at
json.url movie_url(movie, format: :json)
