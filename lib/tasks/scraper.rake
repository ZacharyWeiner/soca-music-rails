namespace :scraper do
	desc "fetch most recent videos from YouTube"
	task scrape: :environment do 
		require 'nokogiri'
		require 'open-uri'
		require 'csv'
	# airbnb url https://www.airbnb.com/s/Fort-Lauderdale--FL--United-States

	#set the uri of the page to be scraped 
		#url = "https://www.youtube.com/results?search_query=soca+official+music+video+-parody+-cover+-fan&search_sort=video_date_uploaded"
		max_pages = 5
		# Parse the page with Nokogiri
		#page = Nokogiri::HTML(open(url))
		music_videos = []
		max_pages.to_i.times do |i|
			url = "https://www.youtube.com/results?search_query=soca+official+music+video+-parody+-cover+-fan+-playlist&search_sort=video_date_uploaded&page=" + i.to_s
			p url
			page = Nokogiri::HTML(open(url))

			page.css('div.yt-lockup-dismissable').each do | result |
				title = result.css('h3.yt-lockup-title').text
				link = result.css('a').map{|link| link['href']}
				id = link[0].split '=' 
				image_thumb = result.css('img').map{|link| link['src']}
				unless title.empty?
					title = title.gsub("Official Music Video", "").gsub("soca", "").gsub("Soca", "").gsub("2015", "").gsub("2014", "").gsub("\"", "").gsub("()", "").gsub("[]", "")
				end 
				#music_videos << [title, link[0], "http://img.youtube.com/vi/#{id[1]}/0.jpg"]
				if Video.where(:title => title).count == 0
					new_video = Video.new 
					new_video.title  = title
					new_video.video_url =  link[0]
					new_video.image_url = "http://img.youtube.com/vi/#{id[1]}/0.jpg"
					new_video.youtube_id = id[1];
					new_video.save
					puts "#{new_video.title} , #{new_video.video_url}, #{new_video.image_url}" 
				else
					puts "already exists"
				end

			page = nil;
			end #end each video item 
		end #end max_pages.times
	end #end task



	desc "fetch most recent videos from YouTube"
	task destroy_all_videos: :environment do 
		@videos = Video.all 
		@videos.each do |v|
			v.destroy
		end
	end#end destroy videos 
end #end scraper