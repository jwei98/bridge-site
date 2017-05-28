require 'test_helper'

class ElectivesControllerTest < ActionController::TestCase
  setup do
    @elective = electives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:electives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create elective" do
    assert_difference('Elective.count') do
      post :create, elective: { capcity: @elective.capcity, description: @elective.description, title: @elective.title }
    end

    assert_redirected_to elective_path(assigns(:elective))
  end

  test "should show elective" do
    get :show, id: @elective
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @elective
    assert_response :success
  end

  test "should update elective" do
    patch :update, id: @elective, elective: { capcity: @elective.capcity, description: @elective.description, title: @elective.title }
    assert_redirected_to elective_path(assigns(:elective))
  end

  test "should destroy elective" do
    assert_difference('Elective.count', -1) do
      delete :destroy, id: @elective
    end

    assert_redirected_to electives_path
  end
end
