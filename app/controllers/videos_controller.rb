class VideosController < ApplicationController
  before_action :set_video, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_video

  # curl -X GET http://localhost:3000/videos
  def index
    @videos = Video.all

    all_videos = []
    @videos.each { |video| all_videos << video.as_json(only: [:title, :desc], methods: [:actors, :directors]) }

    render json: { videos: all_videos, success: true }
  end

  # curl -X POST --data "title=title&desc=description&actors=Tom+Cruise%2CJohn+Smith%2CAngelina+Jolie&directors=Steven+Spielberg" http://localhost:3000/videos
  def create
    @video = Video.new(title: params[:title], desc: params[:desc])

    actors = params[:actors].split(',')
    @video.add_actors(actors)

    directors = params[:directors].split(',')
    @video.add_directors(directors)

    if @video.save
      render json: { video: @video.as_json(only: [:title, :desc], methods: [:actors, :directors]), success: true }, status: :created, location: @video
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # curl -X PUT --data "title=new+title&desc=new+description&actors=Tom+Cruise%2CJohn+Smith%2CAngelina+Jolie&directors=Steven+Spielberg" http://localhost:3000/videos/1
  def update
    @video = Video.find(params[:id])

    if @video.update(video_params)
      head :no_content
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # curl -X DELETE http://localhost:3000/videos/1
  def destroy
    video_to_delete = @video
    @video.destroy

    head :no_content

    if @video.destroy
      render json: { video: video_to_delete.as_json(only: [:title, :desc], methods: [:actors, :directors]), success: true }
    end
  end

  private

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :desc)
    end

    def invalid_video
      render json: { success: false, error: "invalid video ID"}
    end
end
