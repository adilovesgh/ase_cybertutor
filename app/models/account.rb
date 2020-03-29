class Account < ActiveRecord::Base
    has_secure_password
    has_one :student
    has_one :tutor
end
