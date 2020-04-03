class Orders::Stripe
  INVALID_STRIPE_OPERATION = 'Invalid Stripe Operation'
  def self.execute(order:, price_cents:, description:)
    charge = self.execute_charge(price_cents: price_cents,
                                 description: description,
                                 card_token:  order.token)
    unless charge&.id.blank?
      # If there is a charge with id, set order paid.
      order.charge_id = charge.id
      puts("Order charge ID: #{order.charge_id}")
      order.set_paid
      puts("Order set paid: #{order.set_paid}")
    end
  rescue Stripe::StripeError => e
    # If a Stripe error is raised from the API,
    # set status failed and an error message
    order.error_message = INVALID_STRIPE_OPERATION
    order.set_failed
  end

  private
  def self.execute_charge(price_cents:, description:, card_token:)
    # puts("Price cents: #{price_cents.to_i.to_s}")
    # puts("Description: #{description}")
    # puts("Card token: #{card_token}")
    Stripe::Charge.create({
      amount: price_cents.to_i.to_s,
      currency: "usd",
      description: "description",
      source: card_token
    })
  end
end