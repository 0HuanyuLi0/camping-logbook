class SitesController < ApplicationController

  before_action :check_if_logged_in, only:[:edit]
  before_action :check_if_admin, only:[:destroy]



  def new
    @site = Site.new
  end

  def create

    @site = Site.create site_params


    if params[:photo_links].present?
      params[:photo_links].each do |link|
        Photo.create(
          link:link,
          site_id:@site.id
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
  end

  def edit
    @site = Site.find params[:id]
    @is_admin = check_if_admin

  end

  def update
   
    @site = Site.find params[:id]

    @site.update site_params

    if params[:photos].present?
      # raise "hell"
      params[:photos].keys.each do |key|
          p = Photo.find_by id: key
          if params[:photos][key].present?
            p.update(
              link: params[:photos][key]
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
          user_id:@current_user.id
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
    Site.destroy params[:id]
    redirect_to sites_path
  end


  private
  def site_params
    params.require(:site).permit(:name,:location,:coordinates,:price,:link,:powered,:pets,:description)
  end

end
