source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails',                    '6.0.3.rc1'
gem 'puma',                     '~> 4.1'
gem 'bootsnap',                 '>= 1.4.2', require: false
gem 'pg',                       '~> 0.18.4'
gem 'whenever',                 '~> 1.0.0'
gem 'redis',                    '~> 4.1.3'
gem "aws-sdk-s3",               require: false

group :development, :test do
    gem 'byebug',               platforms: [:mri, :mingw, :x64_mingw]
    gem 'rspec-rails',          '~> 4.0.0'
    gem 'factory_bot_rails',    '~> 5.1.1'
end

group :development do
  gem 'listen',                 '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen',  '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]