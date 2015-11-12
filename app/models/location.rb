# == Schema Information
#
# Table name: locations
#
#  id      :integer          not null, primary key
#  country :string
#  state   :string
#  city    :string
#  address :string
#

class Location < ActiveRecord::Base
  has_many :outcomes
end
