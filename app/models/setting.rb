class Setting < ActiveRecord::Base
  belongs_to :api
  serialize :email_ids
end
