class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :name, null: false
      t.string :mean, null: false
      t.integer :score
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
