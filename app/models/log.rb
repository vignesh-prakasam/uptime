class Log < ActiveRecord::Base
  belongs_to :api

  def time_lapsed
    Time.at((Time.now - self.created_at).round.abs).utc.strftime "%M:%S"
  end
end
