# Load the rails application
require File.expand_path('../application', __FILE__)

# load fb info
APP_CONFIG = YAML::load_file("#{Rails.root}/config/twitter.yml")

require File.dirname(__FILE__) + '/../lib/mysql_utf8'

# Initialize the rails application
Linkodrama::Application.initialize!
