require 'test_helper'

class TipoFornecedorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_fornecedor = tipo_fornecedors(:one)
  end

  test "should get index" do
    get tipo_fornecedors_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_fornecedor_url
    assert_response :success
  end

  test "should create tipo_fornecedor" do
    assert_difference('TipoFornecedor.count') do
      post tipo_fornecedors_url, params: { tipo_fornecedor: { condominio_id: @tipo_fornecedor.condominio_id, nome: @tipo_fornecedor.nome } }
    end

    assert_redirected_to tipo_fornecedor_url(TipoFornecedor.last)
  end

  test "should show tipo_fornecedor" do
    get tipo_fornecedor_url(@tipo_fornecedor)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_fornecedor_url(@tipo_fornecedor)
    assert_response :success
  end

  test "should update tipo_fornecedor" do
    patch tipo_fornecedor_url(@tipo_fornecedor), params: { tipo_fornecedor: { condominio_id: @tipo_fornecedor.condominio_id, nome: @tipo_fornecedor.nome } }
    assert_redirected_to tipo_fornecedor_url(@tipo_fornecedor)
  end

  test "should destroy tipo_fornecedor" do
    assert_difference('TipoFornecedor.count', -1) do
      delete tipo_fornecedor_url(@tipo_fornecedor)
    end

    assert_redirected_to tipo_fornecedors_url
  end
end
