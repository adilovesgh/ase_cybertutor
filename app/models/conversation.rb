class Conversation < ActiveRecord::Base
  has_many :messages, dependent: :destroy
  belongs_to :sender, foreign_key: :sender_id, class_name: Account
  belongs_to :recipient, foreign_key: :recipient_id, class_name: Account

  validates :sender_id, uniqueness: { scope: :recipient_id }

  # scope :between, -> (sender_id, recipient_id) do
  #   where(sender_id: sender_id, recipient_id: recipient_id).or(
  #     where(sender_id: recipient_id, recipient_id: sender_id)
  #   )
  # end

  scope :between, -> (sender_id, recipient_id) do
    where("(sender_id = ? AND recipient_id = ?) OR (sender_id = ? AND recipient_id = ?)", sender_id.to_i, recipient_id.to_i, recipient_id.to_i, sender_id.to_i)
  end

  def self.get(sender_id, recipient_id)
    conversation = between(sender_id, recipient_id).first
    return conversation if conversation.present?

    create(sender_id: sender_id, recipient_id: recipient_id)
  end

  def opposed_account(account)
    account == recipient ? sender : recipient
  end
end