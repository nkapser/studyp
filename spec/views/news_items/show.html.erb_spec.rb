require 'spec_helper'

describe "news_items/show.html.erb" do
  before(:each) do
    @news_item = assign(:news_item, stub_model(NewsItem,
      :description => "Description",
      :url => "Url",
      :source => "Source"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Source/)
  end
end
