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

# Install/Uninstall hubot task.
task :install => :create_hubot_symlink do
  puts 'Installed hubot.'
end

task :create_hubot_symlink do
  hubot = File.dirname(__FILE__) + '/bin/hubot.sh'
  File.symlink(hubot, '/usr/bin/hubot')
end

task :uninstall => :remove_hubot_symlink do
  puts 'Uninstalled hubot.'
end 

task :remove_hubot_symlink do
  if File.symlink? '/usr/bin/hubot'
    File.delete '/usr/bin/hubot'
  end
end
