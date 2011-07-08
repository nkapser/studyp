require 'spec_helper'

describe "news_items/new.html.erb" do
  before(:each) do
    assign(:news_item, stub_model(NewsItem,
      :description => "MyString",
      :url => "MyString",
      :source => "MyString"
    ).as_new_record)
  end

  it "renders new news_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_items_path, :method => "post" do
      assert_select "input#news_item_description", :name => "news_item[description]"
      assert_select "input#news_item_url", :name => "news_item[url]"
      assert_select "input#news_item_source", :name => "news_item[source]"
    end
  end
end
