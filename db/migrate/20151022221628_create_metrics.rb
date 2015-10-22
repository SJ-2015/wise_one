class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.integer :score
      t.string :comment
      t.integer :factor_id
      t.integer :option_id

      t.timestamps null: false
    end
  end
end
