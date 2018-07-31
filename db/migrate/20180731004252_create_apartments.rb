class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.string :number
      t.string :floor
      t.string :block
      t.string :dweller
      t.string :fone
      t.string :email
      t.belongs_to :tenant, foreign_key: true
      t.belongs_to :condominio, foreign_key: true

      t.timestamps
    end
  end
end
