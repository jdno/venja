# frozen_string_literal: true

require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home page" do
    get page_url(id: "home")
    assert_response :success
  end
end
