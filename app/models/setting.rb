class Setting < ActiveRecord::Base
  belongs_to :api
  serialize :email_ids
  before_create :split_mail
  before_update :split_mail
  before_save :split_mail

  def split_mail
    self.email_ids =  self.email_ids.split(',')
  end
end
