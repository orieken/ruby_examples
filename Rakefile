require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'webdrivers'

load 'webdrivers/Rakefile'
Webdrivers.install_dir = "#{Dir.pwd}/webdrivers"

desc 'runs api, ui, and cucumber examples'
task :default => [:api, :ui, :cu]

desc 'run api specs'
task :api do
  RSpec::Core::RakeTask.new(:api) do |t|
    t.pattern = 'spec/api'
  end
  Rake::Task['spec'].execute
end

desc 'RSsec UI specs'
task :ui => 'webdrivers:chromedriver:update' do
  RSpec::Core::RakeTask.new(:ui) do |t|
    t.pattern = 'spec/ui'
  end
  Rake::Task['spec'].execute
end

desc 'Cucumber scenarios'
task :cu => 'webdrivers:chromedriver:update' do
  Cucumber::Rake::Task.new(:cu) do |t|
    t.profile = 'default'
  end
end
