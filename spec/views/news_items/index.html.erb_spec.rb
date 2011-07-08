require 'spec_helper'

describe "news_items/index.html.erb" do
  before(:each) do
    assign(:news_items, [
      stub_model(NewsItem,
        :description => "Description",
        :url => "Url",
        :source => "Source"
      ),
      stub_model(NewsItem,
        :description => "Description",
        :url => "Url",
        :source => "Source"
      )
    ])
  end

  it "renders a list of news_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Source".to_s, :count => 2
  end
end
