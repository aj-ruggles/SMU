class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.string :mon
      t.string :tues
      t.string :wed
      t.string :thur
      t.string :fri
      t.string :sat
      t.string :sun

      t.timestamps
    end
  end
end
