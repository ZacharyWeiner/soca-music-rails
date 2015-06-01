class VideosController < InheritedResources::Base
	before_action :fetch_video, only: [:upvote_video, :downvote_video]


 def index
 	@videos = Video.order('created_at DESC').paginate(:page => params[:page], :per_page => 30)
 end


def upvote_video
	fetch_video
	if current_user
		@video.vote_by voter: current_user, :vote => 'like', :duplicate => 'false'
		#flash[:notice] = "This video kicks ass right?"
		@video.save
		render('show')
	end
end

def downvote_video
	fetch_video
	if current_user
		@video.vote_by voter: current_user, :vote => 'bad', :duplicate => 'false'
		#flash[:notice] = "This video sux huh?"
		render('show')
	end
end

  private

    def video_params
      params.require(:video).permit(:title, :video_url, :image_url, :tags)
    end

    def fetch_video
    	@video = Video.find(params[:id])
    end
end

