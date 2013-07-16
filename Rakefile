require 'rake/testtask'
require 'mail'

require File.dirname(__FILE__) + '/OctokitClient.rb'

task :default => [:test]

@live_site_deploy = Jenkins::LiveDeploy.new

task :notify_group do
  @live_site_deploy.notifyGroup
end

task :print_mail do
  @live_site_deploy.printDeployEmail
end


Rake::TestTask.new do |t|
    t.pattern = "tests/*.rb"
end
