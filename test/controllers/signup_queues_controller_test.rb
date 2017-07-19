require 'test_helper'

class SignupQueuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get signup_queues_index_url
    assert_response :success
  end

  test "should get new" do
    get signup_queues_new_url
    assert_response :success
  end

end
