class ReviewsController < ApplicationController
	def index
        @tutor = Tutor.find(params[:tutor_id])
        @reviews = @tutor.reviews
        @subjects = @tutor.subjects
        if Subject.exists? id: params[:subject_id]
            @subject = Subject.find(params[:subject_id])
        else
            @subject = nil
        end
    end

    def show
        
    end

    def new
        if Subject.exists? id: params[:subject_id]
            @subject = Subject.find(params[:subject_id])
        else
            @subject = nil
        end
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
