class AddTipoDespesaToDespesas < ActiveRecord::Migration[5.1]
  def change
    add_reference :despesas, :tipo_despesa, foreign_key: true
  end
end
