class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :nit
      t.string :contact_name
      t.string :cell_phone
      t.belongs_to :bank, foreign_key: true, index: true
      t.belongs_to :user, foreign_key: true, index: true
      t.string :account

      t.timestamps
    end
  end
end
