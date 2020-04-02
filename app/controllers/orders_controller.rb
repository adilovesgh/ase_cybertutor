class OrdersController < ApplicationController
  # before_action :authenticate_user!
  def index
    @tutor = Tutor.find(params[:tutor_id])
    @subject = Subject.find(params[:subject_id])
    puts("Tutor name: #{@tutor.account.name}")
    puts("Subject name: #{@subject.name}")
    sessions = Session.all
    @sessions_purchase = sessions.where(stripe_plan_name:nil, paypal_plan_name:nil)
    @sessions_subscription = sessions - @sessions_purchase
  end

  def submit
  end
end