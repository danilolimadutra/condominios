require 'test_helper'

class TipoDespesasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_despesa = tipo_despesas(:one)
  end

  test "should get index" do
    get tipo_despesas_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_despesa_url
    assert_response :success
  end

  test "should create tipo_despesa" do
    assert_difference('TipoDespesa.count') do
      post tipo_despesas_url, params: { tipo_despesa: { nome: @tipo_despesa.nome, tenant_id: @tipo_despesa.tenant_id } }
    end

    assert_redirected_to tipo_despesa_url(TipoDespesa.last)
  end

  test "should show tipo_despesa" do
    get tipo_despesa_url(@tipo_despesa)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_despesa_url(@tipo_despesa)
    assert_response :success
  end

  test "should update tipo_despesa" do
    patch tipo_despesa_url(@tipo_despesa), params: { tipo_despesa: { nome: @tipo_despesa.nome, tenant_id: @tipo_despesa.tenant_id } }
    assert_redirected_to tipo_despesa_url(@tipo_despesa)
  end

  test "should destroy tipo_despesa" do
    assert_difference('TipoDespesa.count', -1) do
      delete tipo_despesa_url(@tipo_despesa)
    end

    assert_redirected_to tipo_despesas_url
  end
end
