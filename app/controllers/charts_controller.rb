class ChartsController < ApplicationController
  before_action :authenticate_user!

  def outcomes_by_employer
    by_employer = []
    Employer.all.each do |e|
      color = "#" + "%06x" % (rand * 0xffffff)
      by_employer << {value: e.outcomes.count, color: color, label: e.name}
    end

    render json: {charts: by_employer}
  end

  def outcomes_by_location
    slices = []
    Location.all.each do |l|
      color = "#" + "%06x" % (rand * 0xffffff)
      slices << {value: l.outcomes.count, color: color, label: l.address}
    end

    render json: {charts: slices}
  end

  def outcomes_by_industry
    industries = Hash.new(0)
    Outcome.all.each do |o|
      industries[o.industry] += 1
    end

    slices = []
    industries.each do |k, v|
      color = "#" + "%06x" % (rand * 0xffffff)
      color = "#" + "%06x" % (rand * 0xffffff)
      k ||= "No industry provided"
      slices << {label: k, color: color, value: v}
    end

    render json: {charts: slices}
  end
end
