require 'test_helper'

class IncomeTipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @income_tipe = income_tipes(:one)
  end

  test "should get index" do
    get income_tipes_url
    assert_response :success
  end

  test "should get new" do
    get new_income_tipe_url
    assert_response :success
  end

  test "should create income_tipe" do
    assert_difference('IncomeTipe.count') do
      post income_tipes_url, params: { income_tipe: { name: @income_tipe.name, tenant_id: @income_tipe.tenant_id } }
    end

    assert_redirected_to income_tipe_url(IncomeTipe.last)
  end

  test "should show income_tipe" do
    get income_tipe_url(@income_tipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_income_tipe_url(@income_tipe)
    assert_response :success
  end

  test "should update income_tipe" do
    patch income_tipe_url(@income_tipe), params: { income_tipe: { name: @income_tipe.name, tenant_id: @income_tipe.tenant_id } }
    assert_redirected_to income_tipe_url(@income_tipe)
  end

  test "should destroy income_tipe" do
    assert_difference('IncomeTipe.count', -1) do
      delete income_tipe_url(@income_tipe)
    end

    assert_redirected_to income_tipes_url
  end
end
