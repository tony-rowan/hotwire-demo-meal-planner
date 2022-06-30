class Meal < ApplicationRecord
  validates :meal, presence: true
  validates :date, presence: true

  after_create_commit ->(meal) {
    broadcast_replace_to(
      "calendar", target: "date_#{meal.date}",
      partial: "calendars/date", locals: { meal: meal, date: meal.date }
    )
  }

  after_update_commit ->(meal) {
    broadcast_replace_to(
      "calendar", target: "date_#{meal.date}",
      partial: "calendars/date", locals: { meal: meal, date: meal.date }
    )
  }

  after_destroy_commit ->(meal) {
    broadcast_replace_to(
      "calendar", target: "date_#{meal.date}",
      partial: "calendars/date", locals: { meal: nil, date: meal.date }
    )
  }
end
