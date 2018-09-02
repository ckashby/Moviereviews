class ReviewsController < ApplicationController
  before_action :find_review, only: [:show]
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    # @review.movie_id =
  end

  def show
  end

    private

    def find_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:reviews).permit(:rating, :comment, :movie_id, :user_id)
    end



end
