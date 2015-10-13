class VideosController < ApplicationController
  before_action :set_video, only: [:show, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all

    render json: @videos
  end

  # POST /videos
  # POST /videos.json
  def create
    # p "#" * 50
    # p "VIDEO PARAMS!!!!!!!!!!"
    # p params
    @video = Video.new(title: params[:title], desc: params[:desc])
    actors = params[:actors].split(',')
    @video.add_actors(actors)
    directors = params[:directors].split(',')
    @video.add_directors(directors)
    # p "*" * 30
    # p "@video is:"
    # p @video
    # p "*" * 30
    # p "@video.actors is:"
    # p @video.actors
    # p "*" * 30
    # p "@video.directors is:"
    # p @video.directors
    # p "#" * 50

    if @video.save
      # p "------------------- YOU MADE IT"
      # p "*" * 30
      # p "@video is:"
      # p @video
      # p "*" * 30
      # p "@video.actors is:"
      # p @video.actors
      # p "*" * 30
      # p "@video.directors is:"
      # p @video.directors
      # p "*" * 30
      # return @video.to_json
      render json: {video: @video.as_json(only: [:title, :desc], methods: [:actors, :directors]), success: true}, status: :created, location: @video
    else
      # p "NOOOOOOOOOOOOOOOOOOO"
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    @video = Video.find(params[:id])

    if @video.update(video_params)
      head :no_content
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    # @video.destroy

    # head :no_content

    if @video.destroy

      head :no_content
      render json: @video
    else
      @video.error "Invalid video ID"
      render json: @video
    end
  end

  private

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :desc)
    end
end
