class ReviewsController < ApplicationController
	def index
        @subject = Subject.find(params[:subject_id])
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
	    @review = @tutor.reviews.build(review_params)
        #To Do: save a student infor on the review.
        @review.save
        redirect_to subject_tutor_reviews_path(params[:subject_id], params[:tutor_id])
    end

    private
    def review_params
        params.require(:review).permit(:rating, :comment)
    end
end
