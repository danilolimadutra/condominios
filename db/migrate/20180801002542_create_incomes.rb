class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes do |t|
      t.belongs_to :tenant, foreign_key: true
      t.belongs_to :condominio, foreign_key: true
      t.belongs_to :income_tipe, foreign_key: true
      t.belongs_to :apartment, foreign_key: true
      t.belongs_to :forma_pagamento, foreign_key: true
      t.date :date
      t.decimal :payment, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
