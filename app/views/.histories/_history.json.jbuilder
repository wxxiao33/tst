json.extract! history, :id, :user_id, :challenge_id, :continuous_check_in, :finished, :boolean, :created_at, :updated_at
json.url history_url(history, format: :json)
