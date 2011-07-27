require 'test_helper'

class PusersControllerTest < ActionController::TestCase
  setup do
    @puser = pusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create puser" do
    assert_difference('Puser.count') do
      post :create, :puser => @puser.attributes
    end

    assert_redirected_to puser_path(assigns(:puser))
  end

  test "should show puser" do
    get :show, :id => @puser.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @puser.to_param
    assert_response :success
  end

  test "should update puser" do
    put :update, :id => @puser.to_param, :puser => @puser.attributes
    assert_redirected_to puser_path(assigns(:puser))
  end

  test "should destroy puser" do
    assert_difference('Puser.count', -1) do
      delete :destroy, :id => @puser.to_param
    end

    assert_redirected_to pusers_path
  end
end
