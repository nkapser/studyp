# require 'spec_helper'

describe College do
  it "should get cutoff scores for all the courses" do 
    College.get_cutoff_scores_for_courses.should_not be_nil
  end
end
