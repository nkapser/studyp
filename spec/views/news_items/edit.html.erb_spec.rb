require 'spec_helper'

describe "news_items/edit.html.erb" do
  before(:each) do
    @news_item = assign(:news_item, stub_model(NewsItem,
      :description => "MyString",
      :url => "MyString",
      :source => "MyString"
    ))
  end

  it "renders the edit news_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => news_items_path(@news_item), :method => "post" do
      assert_select "input#news_item_description", :name => "news_item[description]"
      assert_select "input#news_item_url", :name => "news_item[url]"
      assert_select "input#news_item_source", :name => "news_item[source]"
    end
  end
end
