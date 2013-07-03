require 'octokit'
require 'erb'

module Jenkins
  class OctokitClient

    def initialize
      credentials = {
        :login => ENV['GITHUB_JENKINS_USER'],
        :password => ENV['GITHUB_JENKINS_USER_PASSWORD']
      }
      @client = Octokit.new credentials
      @website = 'jenkinslaw/website'
    end

    def getReadyToDeployIssues
      ready = {
        :labels => '4 - Ready to Deploy',
        :state =>'open',
      }
      @client.list_issues @website, ready
    end

  end

  class LiveDeploy
    def initialize
      client = Jenkins::OctokitClient.new
      @ready_to_deploy_issues = client.getReadyToDeployIssues
    end

    def printDeployEmail
      puts self.generateEmail
    end

    def generateEmail
      email_template = File.open 'templates/live_site_deploy.htm.erb', 'r'
      erb = ERB.new email_template.read
      erb.result(binding)
    end

  end
end

