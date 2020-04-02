class Session < ActiveRecord::Base
  belongs_to :student
  belongs_to :tutor
  belongs_to :subject
  has_many :requests
  monetize :price_cents
  has_many :orders

  def self.convert_time(input)
    @start = Time.parse(input['month']+" " + input['day'].to_s + " 2020 " + input['start_hour'].to_s + ":" + input['start_minute'])
    @end = @start + 60 * input['minutes'].to_i + 3600 * input['hours'].to_i
    [@start, @end]
  end
end