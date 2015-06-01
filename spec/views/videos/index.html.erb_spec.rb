require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        :title => "Title",
        :video_url => "Video Url",
        :image_url => "Image Url",
        :tags => "Tags"
      ),
      Video.create!(
        :title => "Title",
        :video_url => "Video Url",
        :image_url => "Image Url",
        :tags => "Tags"
      )
    ])
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Video Url".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "Tags".to_s, :count => 2
  end
end
