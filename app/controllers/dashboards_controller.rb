class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def home
    @outcomes = Outcome.all


    @by_location = []

    @by_industry = []
  end

  # def outcomes_by_employer_data
  #   render json: {}
  # end
end
