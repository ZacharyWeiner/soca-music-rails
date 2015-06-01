require 'rails_helper'

RSpec.describe "videos/show", type: :view do
  before(:each) do
    @video = assign(:video, Video.create!(
      :title => "Title",
      :video_url => "Video Url",
      :image_url => "Image Url",
      :tags => "Tags"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Video Url/)
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/Tags/)
  end
end
