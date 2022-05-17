class Meal < ApplicationRecord
  validates :meal, presence: true
  validates :date, presence: true

  after_create_commit ->(meal) do
    broadcast_replace_to "calendar", partial: "calendar/date", locals: { date: meal.date, meal: meal }, target: "date_#{meal.date}"
  end
  after_update_commit ->(meal) do
    broadcast_replace_to "calendar", partial: "calendar/date", locals: { date: meal.date, meal: meal }, target: "date_#{meal.date}"
  end
  after_destroy_commit ->(meal) do
    broadcast_replace_to "calendar", partial: "calendar/date", locals: { date: meal.date, meal: nil }, target: "date_#{meal.date}"
  end
end
