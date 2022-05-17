class Meal < ApplicationRecord
  validates :meal, presence: true
  validates :date, presence: true

  after_create_commit ->(meal) { broadcast_update_to_calendar(date: meal.date, meal: meal) }
  after_update_commit ->(meal) { broadcast_update_to_calendar(date: meal.date, meal: meal) }
  after_destroy_commit ->(meal) { broadcast_update_to_calendar(date: meal.date, meal: nil) }

  private

  def broadcast_update_to_calendar(date:, meal:)
    broadcast_replace_to(
      "calendar",
      partial: "calendar/date",
      locals: {date:, meal:},
      target: ApplicationController.helpers.date_dom_id(date)
    )
  end
end
