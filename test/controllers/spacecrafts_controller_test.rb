require 'test_helper'

class SpacecraftsControllerTest < ActionController::TestCase
  setup do
    @spacecraft = spacecrafts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spacecrafts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spacecraft" do
    assert_difference('Spacecraft.count') do
      post :create, spacecraft: { crew: @spacecraft.crew, lat: @spacecraft.lat, long: @spacecraft.long, name: @spacecraft.name }
    end

    assert_redirected_to spacecraft_path(assigns(:spacecraft))
  end

  test "should show spacecraft" do
    get :show, id: @spacecraft
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spacecraft
    assert_response :success
  end

  test "should update spacecraft" do
    patch :update, id: @spacecraft, spacecraft: { crew: @spacecraft.crew, lat: @spacecraft.lat, long: @spacecraft.long, name: @spacecraft.name }
    assert_redirected_to spacecraft_path(assigns(:spacecraft))
  end

  test "should destroy spacecraft" do
    assert_difference('Spacecraft.count', -1) do
      delete :destroy, id: @spacecraft
    end

    assert_redirected_to spacecrafts_path
  end
end
