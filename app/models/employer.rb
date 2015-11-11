# == Schema Information
#
# Table name: employers
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employer < ActiveRecord::Base
  has_many :outcomes
end
