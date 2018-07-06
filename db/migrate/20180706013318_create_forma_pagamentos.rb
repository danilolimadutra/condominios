class CreateFormaPagamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :forma_pagamentos do |t|
      t.string :nome
      t.belongs_to :tenant, foreign_key: true

      t.timestamps
    end
  end
end
