require 'rest_client'

class Api < ActiveRecord::Base
  has_many :notifications
  has_one :setting
  has_many :logs

  def execute_call
    RestClient.get self.url
  end

  def check_status(response = nil)
    response = execute_call if response.blank?
    response.include? self.expected_response
    #return false
  end
end
