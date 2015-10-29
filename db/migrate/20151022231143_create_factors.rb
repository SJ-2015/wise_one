class CreateFactors < ActiveRecord::Migration
  def change
    create_table :factors do |t|
      t.string :name
      t.integer :max_score
      t.integer :decision_id

      t.timestamps null: false
    end
  end
end
