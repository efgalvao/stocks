require 'test_helper'

class FacadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facade = facades(:one)
  end

  test "should get index" do
    get facades_url
    assert_response :success
  end

  test "should get new" do
    get new_facade_url
    assert_response :success
  end

  test "should create facade" do
    assert_difference('Facade.count') do
      post facades_url, params: { facade: { name: @facade.name } }
    end

    assert_redirected_to facade_url(Facade.last)
  end

  test "should show facade" do
    get facade_url(@facade)
    assert_response :success
  end

  test "should get edit" do
    get edit_facade_url(@facade)
    assert_response :success
  end

  test "should update facade" do
    patch facade_url(@facade), params: { facade: { name: @facade.name } }
    assert_redirected_to facade_url(@facade)
  end

  test "should destroy facade" do
    assert_difference('Facade.count', -1) do
      delete facade_url(@facade)
    end

    assert_redirected_to facades_url
  end
end
