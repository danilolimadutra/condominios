class AddFormaPagamentoToDespesa < ActiveRecord::Migration[5.1]
  def change
    add_reference :despesas, :forma_pagamento, foreign_key: true
  end
end
