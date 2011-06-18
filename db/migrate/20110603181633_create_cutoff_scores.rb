class CreateCutoffScores < ActiveRecord::Migration
  def self.up
    create_table :cutoff_scores, :id => false do |t|
      t.float :min_score
      t.float :max_score
      t.integer :exam_year_id
      t.integer :course_id
      t.integer :college_id
    end
  end

  def self.down
    drop_table :cutoff_scores
  end
end
