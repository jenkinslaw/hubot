require 'octokit'
require 'erb'
require File.dirname(__FILE__) + '/LiveDeploy.rb'

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

end

