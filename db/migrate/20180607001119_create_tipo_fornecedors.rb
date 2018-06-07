class CreateTipoFornecedors < ActiveRecord::Migration[5.1]
  def change
    create_table :tipo_fornecedors do |t|
      t.string :nome
      t.belongs_to :condominio, foreign_key: true

      t.timestamps
    end
  end
end
