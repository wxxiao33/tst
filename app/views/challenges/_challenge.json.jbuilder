json.extract! challenge, :id, :name, :category, :description, :coins, :duration, :participant_number, :failed_number, :deadline, :created_at, :updated_at
json.url challenge_url(challenge, format: :json)
