class PhotosController < ApplicationController

  before_action :check_if_logged_in
  before_action :check_if_admin,only:[:index,:show]

  def new
  end

  def create
    
    links = params[:cloud]
    
    unless links.present?
      flash[:error]="No photo uploaded, please 'Select Photos' first, then click 'Upload' button"
      
      return redirect_back(fallback_location: root_path)
    end

    links.each do |lk|

      photo = Photo.new
      photo.link = lk
      photo.user_id = @current_user.id
      photo.site_id = params[:site_id]
      photo.list_id = params[:list_id]
      photo.isPublic = params[:photo][:isPublic]
      photo.save
    
    end
  
      redirect_back(fallback_location: root_path)

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
    
    redirect_back(fallback_location: root_path)

  end

end
