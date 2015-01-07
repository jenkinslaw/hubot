require 'rake/testtask'
require 'mail'
require File.dirname(__FILE__) + '/OctokitClient.rb'

task :default => [:test]


task :notify_group do
  app = Jenkins::LiveDeploy.new
  app.notifyGroup
end

task :notify_group_complete do
  mail = Mail.new do
    from 'webmaster@jenkinslaw.org'
    to   'websitenotification@jenkinslaw.org'
    subject 'Live Site Update.'
    html_part do 
      content_type 'text/html; charset=UTF=8'
      body  <<-EOT
        This process is now complete.
        Thanks,

        Jenkins Dev Team.
      EOT
    end
  end
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
