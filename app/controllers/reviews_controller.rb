class ReviewsController < ApplicationController
	def index
        @tutor = Tutor.find(params[:tutor_id])
        @reviews = @tutor.reviews
    end

    def show
        
    end

    def new
        @tutor = Tutor.find(params[:tutor_id])
    end

    def create
    	@tutor = Tutor.find(params[:tutor_id])
        @review = @tutor.reviews.create(review_params)
        @review.save
        redirect_to tutor_reviews_path(params[:tutor_id])
    end

    private
    def review_params
        params.require(:review).permit(:rating, :comment)
    end
end
