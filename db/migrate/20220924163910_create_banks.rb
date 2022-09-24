class CreateBanks < ActiveRecord::Migration[6.0]
  def change
    create_table :banks do |t|
      t.string :name
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
