class AlbumsController < ApplicationController
  def new

    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save!
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_band_album_url(params[:band_id])
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def album_params
    album_params = params.require(:album).permit(:title)
    album_params[:band_id] = params[:band_id]
    album_params
  end
end
