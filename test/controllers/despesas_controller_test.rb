require 'test_helper'

class DespesasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @despesa = despesas(:one)
  end

  test "should get index" do
    get despesas_url
    assert_response :success
  end

  test "should get new" do
    get new_despesa_url
    assert_response :success
  end

  test "should create despesa" do
    assert_difference('Despesa.count') do
      post despesas_url, params: { despesa: { anexo: @despesa.anexo, data: @despesa.data, descricao: @despesa.descricao, fornecedor_id: @despesa.fornecedor_id, observacao: @despesa.observacao, pagamento: @despesa.pagamento, tenant_id: @despesa.tenant_id, tipo_despesa_id: @despesa.tipo_despesa_id, user_id: @despesa.user_id, valor: @despesa.valor } }
    end

    assert_redirected_to despesa_url(Despesa.last)
  end

  test "should show despesa" do
    get despesa_url(@despesa)
    assert_response :success
  end

  test "should get edit" do
    get edit_despesa_url(@despesa)
    assert_response :success
  end

  test "should update despesa" do
    patch despesa_url(@despesa), params: { despesa: { anexo: @despesa.anexo, data: @despesa.data, descricao: @despesa.descricao, fornecedor_id: @despesa.fornecedor_id, observacao: @despesa.observacao, pagamento: @despesa.pagamento, tenant_id: @despesa.tenant_id, tipo_despesa_id: @despesa.tipo_despesa_id, user_id: @despesa.user_id, valor: @despesa.valor } }
    assert_redirected_to despesa_url(@despesa)
  end

  test "should destroy despesa" do
    assert_difference('Despesa.count', -1) do
      delete despesa_url(@despesa)
    end

    assert_redirected_to despesas_url
  end
end
