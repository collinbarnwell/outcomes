class ChartsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_params

  def outcomes_by_employer
    by_employer = []
    Employer.all.each do |e|
      color = "#" + "%06x" % (rand * 0xffffff)
      count = @outcome_relation.where(employer_id: e.id).count
      by_employer << {value: count, color: color, label: e.name}
    end

    render json: {charts: by_employer}
  end

  def outcomes_by_location
    slices = []
    Location.all.each do |l|
      color = "#" + "%06x" % (rand * 0xffffff)
      count = @outcome_relation.where(location_id: l.id).count
      slices << {
        value: count,
        color: color,
        label: l.address
      }
    end

    render json: {charts: slices}
  end

  def outcomes_by_industry
    industries = Hash.new(0)
    @outcome_relation.all.each do |o|
      industries[o.industry] += 1
    end

    slices = []
    industries.each do |k, v|
      color = "#" + "%06x" % (rand * 0xffffff)
      color = "#" + "%06x" % (rand * 0xffffff)
      k ||= "No industry provided"
      slices << {
        label: k,
        color: color,
        value: v
      }
    end

    render json: {charts: slices}
  end


  def industries
    options = ['None'] + Outcome.where.not(industry: nil).all.map(&:industry).uniq
    render json: {options: options}
  end

  def employers
    options = ['None'] + Employer.all.map(&:name)
    render json: {options: options}
  end

  def locations
    options = ['None'] + Location.all.map(&:address)
    render json: {options: options}
  end

  private
    def get_params
      @industry = params[:industry] == 'None' ? nil : params[:industry]
      @employer = params[:employer] == 'None' ? nil : params[:employer]
      @location = params[:location] == 'None' ? nil : params[:location]

      @outcome_relation = Outcome
      @outcome_relation = @outcome_relation.where(industry: @industry) if @industry

      if @employer
        e = Employer.find_by(name: @employer)
        @outcome_relation = @outcome_relation.where(employer_id: e.id)
      end

      if @location
        l = Location.find_by(address: @location)
        @outcome_relation = @outcome_relation.where(location_id: l.id)
      end
    end
end
