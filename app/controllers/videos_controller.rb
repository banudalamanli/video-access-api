class VideosController < ApplicationController
  before_action :set_video, only: [:update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_video

  def index
    all_videos = Video.all.map { |video| video.jsonify }

    render json: { videos: all_videos, success: true }
  end

  def create
    @video = Video.new(video_params)

    @video.add_actors(actor_params)
          .add_directors(director_params)

    if @video.save
      render json: { video: @video.jsonify, success: true }, status: :created, location: @video
    else
      render json: { success: false, errors: @video.errors.map{|field, msg| msg}.join(', ') }, status: :unprocessable_entity
    end
  end

  def update
    @video = Video.find(params[:id])

    if @video.update(video_params)
      render json: { video: @video.jsonify, success: true }
    end
  end

  def destroy
    video_data = @video.jsonify

    if @video.destroy
      render json: { video: video_data, success: true }
    end
  end


  private

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.permit(:title, :desc)
    end

    def actor_params
      params.permit(:actor).split(',')
    end

    def director_params
      params.permit(:director).split(',')
    end

    def invalid_video
      render json: { success: false, error: "invalid video ID"}
    end

end
