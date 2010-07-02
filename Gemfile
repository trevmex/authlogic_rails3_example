source 'http://rubygems.org'

gem 'rails', '3.0.0.beta4'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Add support for haml as well as erb
gem 'haml'

# Add support for Authlogic authentication
gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3' # TODO: test this with official version of authlogic

# Add support for paperclip (used for uploading content and profile pics)
gem 'paperclip'

# Add S3 support for attaching files with paperclip
gem 'aws-s3', :require => 'aws/s3'
gem 'right_aws'

# Add support for sqlite3 for dev and test DBs
gem 'sqlite3-ruby', :require => 'sqlite3'

group :development do
  # Add additional generators for Rails in the development environment
  gem 'rails3-generators'

  # Add support for getting this on heroku
  gem 'taps'
  gem 'heroku'
end

# Add support for RSpec in the test environment
group :test do
  gem 'rspec-rails', '>= 2.0.0.beta.13'
  gem 'factory_girl'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri', '1.4.1'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for certain environments:
# gem 'rspec', :group => :test
# group :test do
#   gem 'webrat'
# end
