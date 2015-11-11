# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# Supervisor Name,Supervisor Email,Job Title,Start Date,End Date,
# Ongoing,Salary,Employer Name,Employer Email Address,Status,
# Offer Accepted?,Student Email Address,Student Username,
# Student First Name,Student Last Name,Job Type,Employment Type,
# Industry,Location Address,Location City,Location State,
# Location Country


csv_text = File.read(Rails.root.join('lib', 'seed_data.csv'))

csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  row = row.to_hash

  employer = Employer.find_or_create_by(
    name: row['Employer Name'],
    email: row['Emplyer Email Address']
  )

  location = Location.find_or_create_by(
    address: row['Location Address'],
    city: row['Location City'],
    state: row['Location State'],
    country: row['Location Country']
  )

  alum = Alum.find_or_create_by(
    email: row['Student Email'],
    username: row['Student Username'],
    first_name: row['Student First Name'],
    last_name: row['Student Last Name']
  )

  ongoing = row['Ongoing'] == 't' ? true : false

  outcome = Outcome.find_or_create_by(
    supervisor_name: row['Supervisor Name'],
    supervisor_email: row['Supervisor Email'],
    job_title: row['Job Title'],
    start_date: Date.strptime(row['Start Date'], "%m/%d/%y"),
    end_date: Date.strptime(row['End Date'], "%m/%d/%y"),
    ongoing: ongoing,
    status: row['Status'],
    offer_accepted: row['Offer Accepted?'],
    job_type: row['Job Type'],
    industry: row['Industry'],
    employment_type: row['Employment Type'],
    salary: row['Salary'].to_i,
    location: location,
    alum: alum,
    employer: employer
  )
end

