# Load the rails application
require File.expand_path('../application', __FILE__)

# load fb info
APP_CONFIG = YAML::load_file("#{Rails.root}/config/twitter.yml")

require File.dirname(__FILE__) + '/../lib/mysql_utf8'

Linkodrama::Application.config.middleware.use ExceptionNotifier,
   :email_prefix => "[linkodrama] ",
   :sender_address => %{"notifier" <app@linkodrama.com>},
   :exception_recipients => %w{info@season.es}

# Initialize the rails application
Linkodrama::Application.initialize!
