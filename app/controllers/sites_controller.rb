class SitesController < ApplicationController

  before_action :check_if_logged_in, except:[:index,:show]
  before_action :check_if_admin, only:[:destroy]

  def new
    @site = Site.new
  
  end

  def create
  
    @site = Site.new site_params
    @site.user_id = @current_user.id
    @site.save

    # photo
    links = params[:cloud]
    if links.present?

      links.each do |lk|

        photo = Photo.new
        photo.link = lk
        photo.user_id = @current_user.id
        photo.site_id = @site.id
        photo.isPublic = true
        photo.save
      
      end

    end

    

    if @site.persisted?
      redirect_to @site
    else
      render :new
    end


  end

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find params[:id]
    @reviews = Review.new
    @photo = Photo.new
    @story = Story.new
    if @current_user.present?
      lists = @current_user.lists
    @isListed = "material-symbols-outlined star"

    lists.each do |list|
      if list.sites.include?(@site)
        @isListed = "material-symbols-outlined star filled"
      end
    end
    end
    

  end

  def edit
    @site = Site.find params[:id]
    check_is_owner( @site )
  end

  def update
   
    @site = Site.find params[:id]
    check_is_owner( @site )
    @site.update site_params
    
    links = params[:cloud]
    if links.present?

      links.each do |lk|

        photo = Photo.new
        photo.link = lk
        photo.user_id = @current_user.id
        photo.site_id = @site.id
        photo.isPublic = true
        photo.save
      
      end

    end

    if @site.persisted?
      redirect_to @site
    else
      render :new
    end
  end

  def destroy
    site = Site.find params[:id]
    check_is_owner( site )
    Site.destroy params[:id]
    redirect_to sites_path
  end

  def add_to_list
    @site = Site.find params[:id]
    @lists = List.where(user:@current_user)
  end

  def add_to_list_create

    site = Site.find_by(id:params[:id])
    lists_id = params[:lists]

    all_lists = List.where(user:@current_user)

    all_lists.each do |l|
      l.sites.destroy site
    end

    if lists_id.present?

      lists_id.each do |list_id|
        list = List.find_by(id:list_id)
        check_is_owner(list)

        unless list.sites.include?(site)
          list.sites << site
          list.save
        end
      end

    end
    redirect_to site_path(site)

  end

  

  private
  def site_params
    params.require(:site).permit(:name,:location,:coordinates,:price,:link,:powered,:pets,:description)
  end


end
