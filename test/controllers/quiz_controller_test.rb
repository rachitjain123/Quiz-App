require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get quiz_add_url
    assert_response :success
  end

  test "should get edit" do
    get quiz_edit_url
    assert_response :success
  end

end
