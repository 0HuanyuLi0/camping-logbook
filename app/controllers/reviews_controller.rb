class ReviewsController < ApplicationController
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
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:score,:comment)
  end


end
