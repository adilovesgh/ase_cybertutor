class Session < ActiveRecord::Base
  belongs_to :student
  belongs_to :tutor
  belongs_to :subject

  def self.convert_time(input)
    Time.parse(input['month']+" " + input['day'].to_s + " 2020 " + input['start_hour'].to_s + ":" + input['start_minute'])
  end
end
