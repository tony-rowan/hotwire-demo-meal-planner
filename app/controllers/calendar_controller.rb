class CalendarController < ApplicationController
  def show
    @dates = Date.today..10.days.from_now
    @meals = Meal.all.group_by(&:date)
  end
end
