IronWorker.configure do |config|
  config.token = Settings.iron.token
  config.project_id = Settings.iron.project_id
  config.auto_merge = true
end
