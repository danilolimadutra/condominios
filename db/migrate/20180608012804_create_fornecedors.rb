class CreateFornecedors < ActiveRecord::Migration[5.1]
  def change
    create_table :fornecedors do |t|
      t.string :nome
      t.boolean :pf
      t.string :documento
      t.string :contato
      t.string :telefone
      t.string :email
      t.string :site
      t.string :endereco
      t.string :observacao
      t.belongs_to :tenant, foreign_key: true
      t.belongs_to :tipo_fornecedor, foreign_key: true

      t.timestamps
    end
  end
end
