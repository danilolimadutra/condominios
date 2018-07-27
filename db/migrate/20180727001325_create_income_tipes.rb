class CreateIncomeTipes < ActiveRecord::Migration[5.1]
  def change
    create_table :income_tipes do |t|
      t.string :name
      t.belongs_to :tenant, foreign_key: true

      t.timestamps
    end
  end
end
