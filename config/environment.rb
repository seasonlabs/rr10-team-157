# Load the rails application
require File.expand_path('../application', __FILE__)

# load fb info
APP_CONFIG = YAML::load_file("#{Rails.root}/config/twitter.yml")

# Initialize the rails application
Linkodrama::Application.initialize!
