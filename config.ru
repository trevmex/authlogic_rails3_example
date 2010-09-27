# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

# Support for SASS / COMPASS on heroku
require "fileutils"
FileUtils.mkdir_p(Rails.root.join("tmp", "stylesheets", "compiled"))

use Rack::Static, :urls => ["/stylesheets/compiled"], :root => "tmp"

run AuthlogicRails3Example::Application
