class CreateColleges < ActiveRecord::Migration
  def self.up
    create_table :colleges do |t|
      t.string :name
      t.integer :exam_id
    end    
  end

  def self.down
    drop_table :colleges
  end
end
