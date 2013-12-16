require 'test_helper'

class PassesControllerTest < ActionController::TestCase
  setup do
    @pass = FactoryGirl.create(:pass)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:passes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pass" do
    assert_difference('Pass.count') do
      post :create, pass: { duration: @pass.duration, risetime: @pass.risetime, user_id: @pass.user_id }
    end

    assert_redirected_to pass_path(assigns(:pass))
  end

  test "should show pass" do
    get :show, id: @pass
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pass
    assert_response :success
  end

  test "should update pass" do
    patch :update, id: @pass, pass: { duration: @pass.duration, risetime: @pass.risetime, user_id: @pass.user_id }
    assert_redirected_to pass_path(assigns(:pass))
  end

  test "should destroy pass" do
    assert_difference('Pass.count', -1) do
      delete :destroy, id: @pass
    end

    assert_redirected_to passes_path
  end
end
