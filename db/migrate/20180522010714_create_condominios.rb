class CreateCondominios < ActiveRecord::Migration[5.1]
  def change
    create_table :condominios do |t|
      t.string :nome
      t.string :endereco
      t.string :sindico
      t.string :telefone
      t.string :email
      t.belongs_to :tenant, foreign_key: true

      t.timestamps
    end
  end
end
