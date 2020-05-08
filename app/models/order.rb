class Order < ActiveRecord::Base
  enum status: { pending: 0, failed: 1, paid: 2, paypal_executed: 3}
  enum payment_gateway: { stripe: 0, paypal: 1 }
  belongs_to :session
  belongs_to :account

  scope :recently_created, -> { where(created_at: 1.minutes.ago..DateTime.now) }

  def set_paid
    self.status = Order.statuses[:paid]
  end
  def set_failed
    self.status = Order.statuses[:failed]
  end
  def set_paypal_executed
    self.status = Order.statuses[:paypal_executed]
  end
  def self.print_money(input)
    puts("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    puts(input)
    puts((input.to_f/100).round(2))
    output = (input.to_f/100).round(2).to_s
    if output.split('.')[1].length == 1
      output += "0"
    end
    output
  end
end
