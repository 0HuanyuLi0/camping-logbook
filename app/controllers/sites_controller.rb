class SitesController < ApplicationController

  def new
    @site = Site.new

    3.times do
      @site.photos.build
    end

      @site.reviews.build

  end

  def create
    
    @site = Site.new site_params
    if @site.save
    redirect_to @site
    end

  end

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find params[:id]
  end

  def edit
    @site = Site.find params[:id]
    @site.photos.build
    if @site.reviews.empty?
      @site.reviews.build
    end
  end

  def update
    site = Site.find params[:id]
    site.photos.destroy_all
    site.reviews.destroy_all
    site.update site_params
    redirect_to site_path(site)
  end

  def destroy
    Site.destroy params[:id]
    redirect_to sites_path
  end


  private
  def site_params
    params.require(:site).permit(:name,:location,:coordinates,:price,:link,:powered,:pets,:description,photos_attributes: [:link], reviews_attributes: [:score,:comment])
  end

end
