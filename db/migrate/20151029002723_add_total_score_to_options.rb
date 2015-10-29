class AddTotalScoreToOptions < ActiveRecord::Migration
  def change
    add_column :options, :total_score, :integer
  end
end
