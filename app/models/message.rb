class Message < ActiveRecord::Base
  validates :content, presence: true
  # gem doesn't seem to be working
  # validates :email_address, presence: true, 'valid_email_2/email': { mx: true, disposable: true, disallow_subaddressing: true }
  validates :email_address, email: true
end
