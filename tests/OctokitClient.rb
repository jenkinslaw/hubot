require 'minitest/autorun'
require 'octokit'
require 'yaml'
require './OctokitClient.rb'

class TestOctoKitClient < MiniTest::Unit::TestCase
  def setup
    credentials = {
      :login => ENV['GITHUB_JENKINS_USER'],
      :password => ENV['GITHUB_JENKINS_USER_PASSWORD']
    }
    @client = Octokit.new credentials
    @website = 'jenkinslaw/website'
  end

  def testClient
    assert_kind_of(Octokit::Client, @client)
  end

  def testGetIssues
    issues = @client.list_issues @website
    assert_kind_of Array, issues

    assert issues[0].number? 'The issue contains a number.'
    assert issues[0].title? 'The issue contains a title.'
    assert issues[0].html_url? 'The issue contains an html URL.'
  end

end

class TestJenkinsOctoKitClient < MiniTest::Unit::TestCase
  def setup
    @client = Jenkins::OctokitClient.new
  end

  def testGetReadyToDeployIssues
    issues = @client.getReadyToDeployIssues
    assert_kind_of Array, issues
  end
end

class TestJenkinsLiveDeploy < MiniTest::Unit::TestCase
  def setup
    @deploy = Jenkins::LiveDeploy.new
  end

  def testGenerateLiveDeployEmail
    @email = @deploy.generateEmail
    assert_kind_of String, @email
  end

  def testPrintDeployEmail
    assert_output(@email) {@deploy.printDeployEmail}
  end

end

