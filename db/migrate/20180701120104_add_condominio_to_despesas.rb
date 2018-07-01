class AddCondominioToDespesas < ActiveRecord::Migration[5.1]
  def change
    add_reference :despesas, :condominio, foreign_key: true
  end
end
