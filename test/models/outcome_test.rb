# == Schema Information
#
# Table name: outcomes
#
#  id               :integer          not null, primary key
#  supervisor_name  :string
#  supervisor_email :string
#  job_title        :string
#  start_date       :datetime
#  end_date         :datetime
#  ongoing          :boolean
#  status           :string
#  offer_accepted   :string
#  job_type         :string
#  industry         :string
#  employment_type  :string
#  salary           :integer
#  location_id      :integer
#  alum_id          :integer
#  employer_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class OutcomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
