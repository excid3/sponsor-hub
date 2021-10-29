require "test_helper"

class GithubWebhooksControllerTest < ActionDispatch::IntegrationTest
  test "should get sponsored" do
    get github_webhooks_sponsored_url
    assert_response :success
  end
end
