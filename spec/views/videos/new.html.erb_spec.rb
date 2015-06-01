require 'rails_helper'

RSpec.describe "videos/new", type: :view do
  before(:each) do
    assign(:video, Video.new(
      :title => "MyString",
      :video_url => "MyString",
      :image_url => "MyString",
      :tags => "MyString"
    ))
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", videos_path, "post" do

      assert_select "input#video_title[name=?]", "video[title]"

      assert_select "input#video_video_url[name=?]", "video[video_url]"

      assert_select "input#video_image_url[name=?]", "video[image_url]"

      assert_select "input#video_tags[name=?]", "video[tags]"
    end
  end
end
