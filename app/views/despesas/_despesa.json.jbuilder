json.extract! despesa, :id, :descricao, :data, :valor, :pagamento, :observacao, :anexo, :tenant_id, :user_id, :fornecedor_id, :tipo_despesa_id, :created_at, :updated_at
json.url despesa_url(despesa, format: :json)
