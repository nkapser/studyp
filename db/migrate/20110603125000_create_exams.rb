class CreateExams < ActiveRecord::Migration
  def self.up
    create_table :exams do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :exams
  end
end
