class CreateOutcomes < ActiveRecord::Migration
  def change
    create_table :alums do |t|
      t.string :email
      t.string :username
      t.string :last_name
      t.string :first_name

      t.timestamps null: false
    end

    create_table :employers do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end

    create_table :locations do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :address
    end

    create_table :outcomes do |t|
      t.string :supervisor_name
      t.string :supervisor_email
      t.string :job_title
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :ongoing
      t.string :status
      t.string :offer_accepted
      t.string :job_type
      t.string :industry
      t.string :employment_type
      t.integer :salary

      t.belongs_to :location
      t.belongs_to :alum
      t.belongs_to :employer

      t.timestamps null: false
    end
  end
end
