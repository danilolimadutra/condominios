require 'test_helper'

class FornecedorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fornecedor = fornecedors(:one)
  end

  test "should get index" do
    get fornecedors_url
    assert_response :success
  end

  test "should get new" do
    get new_fornecedor_url
    assert_response :success
  end

  test "should create fornecedor" do
    assert_difference('Fornecedor.count') do
      post fornecedors_url, params: { fornecedor: { contato: @fornecedor.contato, documento: @fornecedor.documento, email: @fornecedor.email, endereco: @fornecedor.endereco, nome: @fornecedor.nome, observacao: @fornecedor.observacao, pf: @fornecedor.pf, site: @fornecedor.site, telefone: @fornecedor.telefone, tenant_id: @fornecedor.tenant_id, tipo_fornecedor_id: @fornecedor.tipo_fornecedor_id } }
    end

    assert_redirected_to fornecedor_url(Fornecedor.last)
  end

  test "should show fornecedor" do
    get fornecedor_url(@fornecedor)
    assert_response :success
  end

  test "should get edit" do
    get edit_fornecedor_url(@fornecedor)
    assert_response :success
  end

  test "should update fornecedor" do
    patch fornecedor_url(@fornecedor), params: { fornecedor: { contato: @fornecedor.contato, documento: @fornecedor.documento, email: @fornecedor.email, endereco: @fornecedor.endereco, nome: @fornecedor.nome, observacao: @fornecedor.observacao, pf: @fornecedor.pf, site: @fornecedor.site, telefone: @fornecedor.telefone, tenant_id: @fornecedor.tenant_id, tipo_fornecedor_id: @fornecedor.tipo_fornecedor_id } }
    assert_redirected_to fornecedor_url(@fornecedor)
  end

  test "should destroy fornecedor" do
    assert_difference('Fornecedor.count', -1) do
      delete fornecedor_url(@fornecedor)
    end

    assert_redirected_to fornecedors_url
  end
end
