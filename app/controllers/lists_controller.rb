class ListsController < ApplicationController
  
  before_action :check_if_logged_in

  def new
    @list = List.new
  end

  def create
    
    @list = List.new list_params
    @list.user_id = @current_user.id

    if params[:sites_name].present?
      
      params[:sites_name].each do |site|
        @list.sites << Site.find_by(id:site)
      end

    end


    
    if @list.save
      redirect_to @list
    else
      render :new
    end

  end

  def index
    
    @lists = List.where(user_id:@current_user.id)

  end

  def show
    @list = List.find params[:id]
    @photo = Photo.new
  end

  def edit
    @list = List.find params[:id]
  end

  def update

    @list = List.find params[:id]

    @list.update list_params

   
    @list.sites.destroy_all

    if params[:sites_name].present?
      
      params[:sites_name].each do |site|
        @list.sites << Site.find_by(id:site)
      end

    end

    if @list.persisted?
      redirect_to @list
    else
      render :new
    end


  end

  def destroy
    List.destroy params[:id]
    redirect_to lists_path
  end



  private
  def list_params
    params.require(:list).permit(:title,:note)
  end
  
  

end
