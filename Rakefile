require 'rake'
require 'rake/testtask'
require 'rdoc/task'

desc 'Default: run unit tests.'
task :default => :test

desc 'Run all tests'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "rack-useragent"
    gemspec.authors = ["Sergio Gil", "Luismi Cavallé", "Claes Wallin (韋嘉誠)"]
    gemspec.email = "claes.wallin@greatsinodevelopment.com"
    gemspec.homepage = "http://github.com/clacke/rack-useragent"
    gemspec.summary = "Rack Middleware for filtering by user agent"
    gemspec.add_dependency('rack', '>= 0.9.1')
    gemspec.add_dependency('useragent', '>= 0.1.4')
  end
rescue LoadError
end
