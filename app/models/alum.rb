# == Schema Information
#
# Table name: alums
#
#  id         :integer          not null, primary key
#  email      :string
#  username   :string
#  last_name  :string
#  first_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Alum < ActiveRecord::Base
  has_many :outcomes

  def full_name
    self.first_name + self.last_name
  end
end
