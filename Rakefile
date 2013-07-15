require 'rake/testtask'
require 'mail'

require File.dirname(__FILE__) + '/OctokitClient.rb'

task :default => [:test]

task :notify_group do
  mail = Mail.new do
    from 'webmaster@jenkinslaw.org'
    #to   'websitenotification@jenkinslaw.org'
    to   'dkinzer@jenkinslaw.org'
    subject 'Live Site Update'
    html_part do 
      @live_site_deploy = Jenkins::LiveDeploy.new
      content_type 'text/html; charset=UTF=8'
      body @live_site_deploy.generateEmail
    end
  end
  
  mail.delivery_method :sendmail
  mail.deliver
end

Rake::TestTask.new do |t|
    t.pattern = "tests/*.rb"
end
