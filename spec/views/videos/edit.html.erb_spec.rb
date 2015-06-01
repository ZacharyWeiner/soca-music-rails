require 'rails_helper'

RSpec.describe "videos/edit", type: :view do
  before(:each) do
    @video = assign(:video, Video.create!(
      :title => "MyString",
      :video_url => "MyString",
      :image_url => "MyString",
      :tags => "MyString"
    ))
  end

  it "renders the edit video form" do
    render

    assert_select "form[action=?][method=?]", video_path(@video), "post" do

      assert_select "input#video_title[name=?]", "video[title]"

      assert_select "input#video_video_url[name=?]", "video[video_url]"

      assert_select "input#video_image_url[name=?]", "video[image_url]"

      assert_select "input#video_tags[name=?]", "video[tags]"
    end
  end
end
