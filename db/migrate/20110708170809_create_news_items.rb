class CreateNewsItems < ActiveRecord::Migration
  def self.up
    create_table :news_items do |t|
      t.string :description
      t.string :url
      t.string :source
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :news_items
  end
end
