require 'test_helper'

class SubcommentsControllerTest < ActionController::TestCase
  setup do
    @subcomment = subcomments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subcomments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subcomment" do
    assert_difference('Subcomment.count') do
      post :create, :subcomment => @subcomment.attributes
    end

    assert_redirected_to subcomment_path(assigns(:subcomment))
  end

  test "should show subcomment" do
    get :show, :id => @subcomment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @subcomment.to_param
    assert_response :success
  end

  test "should update subcomment" do
    put :update, :id => @subcomment.to_param, :subcomment => @subcomment.attributes
    assert_redirected_to subcomment_path(assigns(:subcomment))
  end

  test "should destroy subcomment" do
    assert_difference('Subcomment.count', -1) do
      delete :destroy, :id => @subcomment.to_param
    end

    assert_redirected_to subcomments_path
  end
end
