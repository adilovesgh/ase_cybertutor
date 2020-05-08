class OrdersController < ApplicationController
  protect_from_forgery with: :null_session, only: [:create]
  before_action :prepare_new_order, only: [:paypal_create_payment]

  FAILURE_MESSAGE = 'Unfortunately, the payment could not be successfully processed. We apologize for any inconvenience. Please try again later.';

  def index
    puts("Session tutor: #{session[:tutor]}")
    #@tutor = Tutor.find(session[:tutor]["id"])
    #@subject = Subject.find(session[:subject]["id"])
    #@start_time = session[:start_time]
    #@end_time = session[:end_time]
    #@price = session[:price]
    @account = Account.find(session[:account_id])
    #puts("Tutor name: #{@tutor.account.name}")
    #puts("Subject name: #{@subject.name}")
    #puts("Start time: #{@start_time}")
    #puts("End time: #{@end_time}")
  end

  def submit
    puts("In orders controller submit")

    puts("Before - creating an order via PayPal")
    puts("Before - order params: #{order_params}")
    puts("Before - token: #{order_params[:token]}")
    puts("Before - charge ID: #{order_params[:charge_id]}")
    puts("Before - is order null? #{@order.nil?}")
    puts("Before - price cents: #{@price_cents}")
    initialize_account

    # Check which type of order it is
    if order_params[:payment_gateway] == "stripe"
      prepare_new_order
      Orders::Stripe.execute(order: @order, price_cents: @price_cents, description: "Adding $#{@price_cents} to balance")
    elsif order_params[:payment_gateway] == "paypal"
      @order = Orders::Paypal.finish(order_params[:charge_id])
      puts("After - creating an order via PayPal")
      puts("After - order params: #{order_params}")
      puts("After - token: #{order_params[:token]}")
      puts("After - charge ID: #{order_params[:charge_id]}")
      puts("After - is order null? #{@order.nil?}")
      puts("After - price cents: #{@price_cents}")
    end
  ensure
    if @order&.save!
      if @order.paid?
        # Success is rendered when order is paid and saved
        #@session = @tutor.sessions.build(subject:@subject, student:@student, price:@price, start_time:@start_time, end_time:@end_time, pending:true, verified:false)
        #@session.save
        @account.price_cents += @price_cents
        @account.save
        # render html: "Congratulations! You have successfully paid for your CyberTutor session."
        redirect_to account_path(1)
      elsif @order.failed? && !@order.error_message.blank?
        # Render error only if order failed and there is an error_message
        return render html: @order.error_message
      end
    else
      render html: "We apologize, but we could not process the payment for your CyberTutor session."      
    end
  end

  def paypal_create_payment
    puts("In orders controller paypal create payment")
    result = Orders::Paypal.create_payment(order: @order, price_cents: @order.price_cents, description: "Adding $#{@order.price_cents} to balance")
    if result
      render json: { token: result }, status: :ok
    else
      render json: {error: FAILURE_MESSAGE}, status: :unprocessable_entity
    end
  end

  def paypal_execute_payment
    puts("In orders controller paypal execute payment")
    if Orders::Paypal.execute_payment(payment_id: params[:paymentID], payer_id: params[:payerID])
      render json: {}, status: :ok
    else
      render json: {error: FAILURE_MESSAGE}, status: :unprocessable_entity
    end
  end

  private

  def initialize_account
    @order = nil
    @account = Account.find(session[:account_id])
    #@price_cents = session[:price_cents]
    #@subject = Subject.find(session[:subject]["id"])
    #@tutor = Tutor.find(session[:tutor]["id"])
    #@student = @account.student
    #@start_time = session[:start_time]
    #@end_time = session[:end_time]
    #@price = order_params[:price]
    if params[:amount] == "fifty"
      @price_cents = 5000
    elsif params[:amount] == "hundo"
      @price_cents = 10000
    else
      @price_cents = 15000
    end
  end

  # Initialize a new order and and set its account price.
  def prepare_new_order
    initialize_account if @account.nil?
    @order = Order.new(order_params)
    @order.account_id = @account.id
    @order.price_cents = @price_cents
  end

  def order_params
    params.require(:orders).permit(:session_id, :token, :payment_gateway, :charge_id, :amount)
  end
end