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

    if params[:photo_links].present?
      params[:photo_links].each do |link|
        Photo.create(
          link:link,
          site_id:@site.id,
          isPublic:true
        )
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
  end

  def edit
    @site = Site.find params[:id]
    check_is_owner( @site )
  end

  def update
   
    @site = Site.find params[:id]
    check_is_owner( @site )
    @site.update site_params
    

    if params[:photos].present?
      # raise "hell"
      params[:photos].keys.each do |key|
          p = Photo.find_by id: key
          if params[:photos][key].present?
            p.update(
              link: params[:photos][key],
              isPublic:true
            )
          else
            p.destroy
          end
      end
    end

    if params[:photo_links].present?
      # raise "hell"
      params[:photo_links].each do |p_link|
        @ph = Photo.create(
          link:p_link,
          site_id:@site.id,
          user_id:@current_user.id,
          isPublic:true
        )

        unless @ph.persisted?
          return render :edit
        end

      end
    end

    Photo.where(link:nil).destroy_all

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
