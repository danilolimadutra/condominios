class CreateDespesas < ActiveRecord::Migration[5.1]
  def change
    create_table :despesas do |t|
      t.string :descricao
      t.date :data
      t.decimal :valor, :precision => 8, :scale => 2
      t.string :pagamento
      t.string :observacao
      t.string :anexo
      t.belongs_to :tenant, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.belongs_to :fornecedor, foreign_key: true

      t.timestamps
    end
  end
end
