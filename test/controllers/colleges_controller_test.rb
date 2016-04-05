require 'test_helper'

class CollegesControllerTest < ActionController::TestCase
  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get address:string" do
    get :address:string
    assert_response :success
  end

end
