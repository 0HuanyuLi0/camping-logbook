class StoriesController < ApplicationController

  before_action :check_if_logged_in
  before_action :check_if_admin,only:[:index,:show]
  def new
  end

  def create
    story = Story.new story_params
    story.list_id = params[:list_id]
    story.user_id = @current_user.id
    story.site_id = params[:site_id]
    story.save

    if story.list_id.present?
      redirect_to list_path(story.list_id)
    else
      redirect_to site_path(story.site_id)
    end
 
  end

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find params[:id]
  end

  def edit
    @story = Story.find params[:id]
  end

  def update
    story = Story.find params[:id]
    story.update story_params

    if story.list_id.present?
      redirect_to list_path(story.list_id)
    else
      redirect_to site_path(story.site_id)
    end

  end

  def destroy
    story = Story.find params[:id]
    list_id = story.list_id
    site_id = story.site_id
    story.destroy

    if list_id.present?
      redirect_to list_path(list_id)
    else
      redirect_to site_path(site_id)
    end

  end

  private
  def story_params
    params.require(:story).permit(:title,:content)
  end

end
