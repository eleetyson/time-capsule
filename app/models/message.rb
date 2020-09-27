class Message < ActiveRecord::Base
  validates :content, presence: true
  validates :email_address, email: true
end
