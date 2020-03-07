class ReviewsController < ApplicationController
	def index
        @tutor = Tutor.find(params[:tutor_id])
        @reviews = @tutor.reviews
        @subject = Subject.find(params[:subject_id])
    end

    def show
        
    end

    def new
        @subject = Subject.find(params[:subject_id])
        @tutor = Tutor.find(params[:tutor_id])
    end

    def create
    	@tutor = Tutor.find(params[:tutor_id])
        @account = Account.find(session[:account_id])
        if @account.tutor.id.to_s == @tutor.id.to_s
            flash[:error] = "You cannot leave reviews for yourself"
        else
    	    @review = @tutor.reviews.build(review_params)
            @account.student.reviews << @review
            #To Do: save a student infor on the review.
            @review.save
        end
        redirect_to subject_tutor_reviews_path(params[:subject_id], params[:tutor_id])
    end

    private
    def review_params
        params.require(:review).permit(:rating, :comment)
    end
end
