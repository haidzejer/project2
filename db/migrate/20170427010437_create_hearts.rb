class CreateHearts < ActiveRecord::Migration[5.0]
  def change
    create_table :hearts do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :post, foreign_key: true

      t.timestamps
    end
  end
end
