class ReviewsController < ApplicationController
  before_action :check_if_logged_in
  def new
  end

  def create
    
    review = Review.new review_params
    review.user_id = @current_user.id
    review.site_id = params[:site_id]

    if review.save
      redirect_to site_path(review.site_id)
    else 
      render :new
    end

  end

  def index
  end

  def show
  end

  def edit
    @review = Review.find params[:id]
    unless @review.user_id == @current_user.id
      redirect_to site_path(@review.site_id)
    end
  end

  def update
    @review = Review.find params[:id]
    @review.update review_params
    redirect_to site_path(@review.site)
  end

  def destroy
    @review = Review.find params[:id]
    unless @review.user_id == @current_user.id
      redirect_to site_path(@review.site_id)
    end
    Review.destroy params[:id]
    redirect_to site_path(@review.site)
  end

  private

  def review_params
    params.require(:review).permit(:score,:comment)
  end


end
