class AddTenantToTipoFornecedors < ActiveRecord::Migration[5.1]
  def change
    add_reference :tipo_fornecedors, :tenant, foreign_key: true
  end
end
