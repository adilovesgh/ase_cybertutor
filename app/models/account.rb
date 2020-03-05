class Account < ActiveRecord::Base
    has_one :student
    has_one :tutor
end
