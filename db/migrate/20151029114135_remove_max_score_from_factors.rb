class RemoveMaxScoreFromFactors < ActiveRecord::Migration
  def change
    remove_column :factors, :max_score, :string
  end
end
