class Session < ActiveRecord::Base
  belongs_to :student
  belongs_to :tutor
  belongs_to :subject
  has_many :requests
  monetize :price_cents
  has_many :orders

  def self.convert_time(input)
    @start = Time.parse(input['month']+" " + input['day'].to_s + " 2020 " + input['start_hour'].to_s + ":" + input['start_minute'] + " " + input["start_ampm"] + " UTC")
    @end = @start + 60 * input['minutes'].to_i + 3600 * input['hours'].to_i
    [@start, @end]
  end

  def self.no_conflicting_times(target, sessions)
  	sessions.each do |session|
  		if target.start_time > session.start_time and target.end_time < session.end_time
  			return false
  		elsif target.start_time < session.start_time and target.end_time > session.end_time
  			return false
  		elsif target.start_time < session.start_time and target.end_time < session.end_time and target.end_time > session.start_time
  			return false
  		elsif target.start_time > session.start_time and target.end_time > session.end_time and target.start_time < session.end_time
  			return false
  		end
  	end
  	return true
  end

  def self.no_student_conflicting_times(target, sessions)
    sessions.each do |session|
      if target[0] > session.start_time and target[1] < session.end_time
        return false
      elsif target[0] < session.start_time and target[1] > session.end_time
        return false
      elsif target[0] < session.start_time and target[1] < session.end_time and target[1] > session.start_time
        return false
      elsif target[0] > session.start_time and target[1] > session.end_time and target[0] < session.end_time
        return false
      end
    end
    return true
  end

  def self.compute_session_cost(price, input)
  	return price * (input['hours'].to_d + input['minutes'].to_d / 60)
  end
end