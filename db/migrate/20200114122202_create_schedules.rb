# frozen_string_literal: true

class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.belongs_to :user
      t.string :repeat_time, default: '30'
      t.string :sleep_time, default: '20:00'
      t.string :wake_up_time, default: '8:00'
      t.timestamps
    end
  end
end
