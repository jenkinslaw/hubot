require 'rake/testtask'
require File.dirname(__FILE__) + '/OctokitClient.rb'

@live_site_deploy = Jenkins::LiveDeploy.new

task :default => [:test]

task :print_deploy_email do
  @live_site_deploy.printDeployEmail
end

Rake::TestTask.new do |t|
    t.pattern = "tests/*.rb"
end

