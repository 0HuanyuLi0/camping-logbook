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
      redirect_to lists_path
    else
      render :new
    end

  end

  def index
    
    if @current_user.isAdmin
      @lists = List.all
    else
      @lists = List.where(user_id:@current_user.id)
    end


  end

  def show
    @list = List.find params[:id]
    check_is_owner(@list)
    @photo = Photo.new
    @story = Story.new
  end

  def edit
    @list = List.find params[:id]
    check_is_owner(@list)
  end

  def update

    @list = List.find params[:id]
    check_is_owner(@list)

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
    @list = List.find params[:id]
    check_is_owner(@list)
    List.destroy params[:id]
    redirect_to lists_path
  end


  private
  def list_params
    params.require(:list).permit(:title,:note)
  end  

end
