require 'test_helper'

class SpacepeopleControllerTest < ActionController::TestCase
  setup do
    @spaceperson = spacepeople(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spacepeople)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spaceperson" do
    assert_difference('Spaceperson.count') do
      post :create, spaceperson: { Spacecraft_id: @spaceperson.Spacecraft_id, craft: @spaceperson.craft, name: @spaceperson.name }
    end

    assert_redirected_to spaceperson_path(assigns(:spaceperson))
  end

  test "should show spaceperson" do
    get :show, id: @spaceperson
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spaceperson
    assert_response :success
  end

  test "should update spaceperson" do
    patch :update, id: @spaceperson, spaceperson: { Spacecraft_id: @spaceperson.Spacecraft_id, craft: @spaceperson.craft, name: @spaceperson.name }
    assert_redirected_to spaceperson_path(assigns(:spaceperson))
  end

  test "should destroy spaceperson" do
    assert_difference('Spaceperson.count', -1) do
      delete :destroy, id: @spaceperson
    end

    assert_redirected_to spacepeople_path
  end
end
