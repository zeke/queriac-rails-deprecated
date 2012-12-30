#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

begin
  require 'rspec/core/rake_task'
  desc "Run all examples"
  RSpec::Core::RakeTask.new('spec')
  task :default => :spec
rescue LoadError
end

Queriac::Application.load_tasks

# # npm install -g cson jsontool
desc "Generate manifest.json from manifest.cson"
task :manifest => :environment do
  code = "cson2json public/app.cson | json > public/app.json"
  puts code
  exec code
end