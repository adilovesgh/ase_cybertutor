class OrdersController < ApplicationController
  # before_action :authenticate_user!
  def index
    @tutor = Tutor.find(params[:tutor_id])
    @subject = Subject.find(params[:subject_id])
    @start_time = params[:start_time]
    @end_time = params[:end_time]
    @price = params[:price]
    @account = Account.find(session[:account_id])
    @session = @tutor.sessions.build(subject:@subject, student:@student, start_time:@start_time, end_time:@end_time, pending:true, verified:false)
    puts("Tutor name: #{@tutor.account.name}")
    puts("Subject name: #{@subject.name}")
    puts("Start time: #{@start_time}")
    puts("End time: #{@end_time}")
  end

  def submit
  end
end