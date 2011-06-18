class CreateExamYears < ActiveRecord::Migration
  def self.up
    create_table :exam_years do |t|
      t.integer :year
    end
  end

  def self.down
    drop_table :exam_years
  end
end