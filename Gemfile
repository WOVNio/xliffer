source 'http://rubygems.org'

gem 'equivalent-xml'
gem 'nokogiri', '~> 1.10.9'

group :test do
  unless RUBY_VERSION.match(/\A1\.8/)
    gem 'codeclimate-test-reporter', :require => false
  end
end

group :development do
  gem 'rspec', '~> 3'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'simplecov', '>= 0.9.0'
end
