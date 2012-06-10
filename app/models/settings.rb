class Settings < Settingslogic
  source (File.exists?("#{Rails.root}/config/application.yml") ? "#{Rails.root}/config/application.yml" : "#{Rails.root}/config/application.yml.defaults")
  namespace Rails.env
end
