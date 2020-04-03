class OrdersController < ApplicationController
  # before_action :authenticate_user!
  def index
    puts("Session tutor: #{session[:tutor]}")
    @tutor = Tutor.find(session[:tutor]["id"])
    @subject = Subject.find(session[:subject]["id"])
    @start_time = session[:start_time]
    @end_time = session[:end_time]
    @price = session[:price]
    @account = Account.find(session[:account_id])
    puts("Tutor name: #{@tutor.account.name}")
    puts("Subject name: #{@subject.name}")
    puts("Start time: #{@start_time}")
    puts("End time: #{@end_time}")
  end

  def submit
    @order = nil
    @account = Account.find(session[:account_id])
    @price_cents = session[:price_cents]
    @subject = Subject.find(session[:subject]["id"])
    @tutor = Tutor.find(session[:tutor]["id"])
    @student = @account.student
    @start_time = session[:start_time]
    @end_time = session[:end_time]
    @price = session[:price]

    # Check which type of order it is
    if order_params[:payment_gateway] == "stripe"
      prepare_new_order
      Orders::Stripe.execute(order: @order, price_cents: @price_cents, description: "#{@subject.name} Tutoring")
    elsif order_params[:payment_gateway] == "paypal"
      # PAYPAL WILL BE HANDLED HERE
    end
  ensure
    if @order&.save
      if @order.paid?
        # Success is rendered when order is paid and saved
        @session = @tutor.sessions.build(subject:@subject, student:@student, price:@price, start_time:@start_time, end_time:@end_time, pending:true, verified:false)
        @session.save
        # render html: "Congratulations! You have successfully paid for your CyberTutor session."
        redirect_to subject_tutor_sessions_path(1,1)
      elsif @order.failed? && !@order.error_message.blank?
        # Render error only if order failed and there is an error_message
        return render html: @order.error_message
      end
    else
      render html: "We apologize, but we could not process the payment for your CyberTutor session."      
    end
  end

  private
  # Initialize a new order and and set its account price.
  def prepare_new_order
    @order = Order.new(order_params)
    @order.account_id = @account.id
    @order.price_cents = @price_cents
  end

  def order_params
    params.require(:orders).permit(:session_id, :token, :payment_gateway, :charge_id)
  end
end