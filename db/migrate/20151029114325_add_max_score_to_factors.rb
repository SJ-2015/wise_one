class AddMaxScoreToFactors < ActiveRecord::Migration
  def change
    add_column :factors, :max_score, :integer
  end
end
