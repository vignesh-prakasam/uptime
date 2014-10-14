require 'rest_client'
# require 'addressable/uri'

class Api < ActiveRecord::Base
  has_many :notifications , :dependent => :destroy
  has_one :setting , :dependent => :destroy
  has_many :logs , :dependent => :destroy

  accepts_nested_attributes_for :setting

  def execute_call
    RestClient.get URI.encode(self.url)
  end

  def check_status(response = nil)
    response = execute_call if response.blank?
    response.include? self.expected_response
    #return false
  end
end
