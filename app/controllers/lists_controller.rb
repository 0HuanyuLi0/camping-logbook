class ListsController < ApplicationController
  
  before_action :check_if_logged_in

  def new
    @list = List.new
  end

  def create
    @list = List.new list_params
    @list.user_id = @current_user.id
    
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
  end

  def edit
    @list = List.find params[:id]
  end

  def update
  end

  def destroy
    List.destroy params[:id]
    redirect_to lists_path
  end

  def add_sites
    @list = List.find params[:id]
  end

  def add_sites_post
    @list = List.find params[:id]

    if params[:sites_name].present?
      params[:sites_name].each do |par|

        site = Site.find_by(id:par)
        @list.sites << site

      end
    end
    redirect_to list_path @list


  end

  private
  def list_params
    params.require(:list).permit(:title,:note)
  end
  
  

end
