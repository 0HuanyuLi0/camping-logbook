class PhotosController < ApplicationController

  before_action :check_if_logged_in
  before_action :check_if_admin,only:[:index,:show]

  def new
  end

  def create

    photo = Photo.new photo_params
    photo.user_id = @current_user.id
    photo.site_id = params[:site_id]
    photo.list_id = params[:list_id]

    if photo.save
      if photo.list_id.present?
        redirect_to list_path(photo.list_id)
      else
        redirect_to site_path(photo.site_id)
      end
    else 
      render :new
    end

  end

  def index
    @photos=Photo.all
  end

  def show
    @photo = Photo.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
    photo = Photo.find params[:id]
    check_is_owner(photo)
    site_id = photo.site_id
    list_id = photo.list_id
    Photo.destroy params[:id]
    
    if list_id.present?
      redirect_to list_path(list_id)
    else
      redirect_to site_path(site_id)
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:link)
  end
end
