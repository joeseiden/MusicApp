class TracksController < ApplicationController
  def new
    @album = Album.find(params[:album_id])
    @track = Track.new(album_id: params[:album_id])
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      @album = @track.album
      flash[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to edit_track_url(@track)
    end
  end

  def destroy
    track = Track.find(params[:id])
    track.destroy
    redirect_to album_url(album.band_id)
  end

  private
  def track_params
    track_params = params.require(:track).permit(:album_id, :title, :ord, :bonus, :lyrics)
  end
end
