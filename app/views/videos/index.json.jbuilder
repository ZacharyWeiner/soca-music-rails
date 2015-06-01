json.array!(@videos) do |video|
  json.extract! video, :id, :title, :video_url, :image_url, :tags
  json.url video_url(video, format: :json)
end
