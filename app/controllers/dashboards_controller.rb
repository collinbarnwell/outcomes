class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def home
    @outcomes = Outcome.all

    @by_employer = []
    Employer.all.each do |e|
      color = "%06x" % (rand * 0xffffff)
      @by_employer << {value: e.outcomes, color: color, label: e.name}
    end

    @by_location = []

    @by_industry = []
  end

  # def outcomes_by_employer_data
  #   render json: {}
  # end
end
