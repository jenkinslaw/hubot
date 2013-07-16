module Jenkins
  class LiveDeploy
    def initialize
      client = Jenkins::OctokitClient.new
      @ready_to_deploy_issues = client.getReadyToDeployIssues
    end

    def notifyGroup
      message = self.generateEmail
      mail = Mail.new do
        from 'webmaster@jenkinslaw.org'
        to   'websitenotification@jenkinslaw.org'
        subject 'Live Site Update'
        html_part do 
          content_type 'text/html; charset=UTF=8'
          body message
        end
      end

      mail.delivery_method :sendmail
      mail.deliver
    end


    def printDeployEmail
      puts self.generateEmail
    end

    def generateEmail
      email_template = File.open File.dirname(__FILE__) + '/templates/live_site_deploy.htm.erb', 'r'
      erb = ERB.new email_template.read
      erb.result(binding)
    end

  end
end

