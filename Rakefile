require 'rake/testtask'
require 'mail'
require File.dirname(__FILE__) + '/OctokitClient.rb'

task :default => [:test]


task :notify_group do
  app = Jenkins::LiveDeploy.new
  app.notifyGroup
end

task :print_mail do
  app = Jenkins::LiveDeploy.new
  app.printDeployEmail
end


Rake::TestTask.new do |t|
    t.pattern = "tests/*.rb"
end
