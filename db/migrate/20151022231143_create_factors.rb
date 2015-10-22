class CreateFactors < ActiveRecord::Migration
  def change
    create_table :factors do |t|
      t.string :name
      t.string :max_score
      t.string :decision_id

      t.timestamps null: false
    end
  end
end
