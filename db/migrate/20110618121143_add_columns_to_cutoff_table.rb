class AddColumnsToCutoffTable < ActiveRecord::Migration
  def self.up
    add_column :cutoff_scores, :oc_boy, :integer
    add_column :cutoff_scores, :oc_girl, :integer
    add_column :cutoff_scores, :sc_boy, :integer
    add_column :cutoff_scores, :sc_girl, :integer
    add_column :cutoff_scores, :st_boy, :integer
    add_column :cutoff_scores, :st_girl, :integer
    add_column :cutoff_scores, :bca_boy, :integer
    add_column :cutoff_scores, :bca_girl, :integer
    add_column :cutoff_scores, :bcb_boy, :integer
    add_column :cutoff_scores, :bcb_girl, :integer
    add_column :cutoff_scores, :bcc_boy, :integer
    add_column :cutoff_scores, :bcc_girl, :integer
    add_column :cutoff_scores, :bcd_boy, :integer
    add_column :cutoff_scores, :bcd_girl, :integer
    add_column :cutoff_scores, :bce_boy, :integer
    add_column :cutoff_scores, :bce_girl, :integer
  end

  def self.down
    remove_column :cutoff_scores, :oc_boy
    remove_column :cutoff_scores, :oc_girl
    remove_column :cutoff_scores, :sc_boy
    remove_column :cutoff_scores, :sc_girl
    remove_column :cutoff_scores, :st_boy
    remove_column :cutoff_scores, :st_girl
    remove_column :cutoff_scores, :bca_boy
    remove_column :cutoff_scores, :bca_girl
    remove_column :cutoff_scores, :bcb_boy
    remove_column :cutoff_scores, :bcb_girl
    remove_column :cutoff_scores, :bcc_boy
    remove_column :cutoff_scores, :bcc_girl
    remove_column :cutoff_scores, :bcd_boy
    remove_column :cutoff_scores, :bcd_girl    
    remove_column :cutoff_scores, :bce_boy
    remove_column :cutoff_scores, :bce_girl
  end
end
