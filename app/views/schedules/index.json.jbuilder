json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :user_id, :mon, :tues, :wed, :thur, :fri, :sat, :sun
  json.url schedule_url(schedule, format: :json)
end
