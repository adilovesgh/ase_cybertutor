class Account < ActiveRecord::Base
    has_secure_password
    has_one :student
    has_one :tutor
    has_many :messages
    has_many :conversations, foreign_key: :sender_id
end
