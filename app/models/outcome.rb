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

class Outcome < ActiveRecord::Base
  belongs_to :location
  belongs_to :alum
  belongs_to :employer
end
