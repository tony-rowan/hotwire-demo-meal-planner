class CalendarsController < ApplicationController
  def show
    @dates = Date.today..10.days.from_now
    @meals = Meal.where(date: @dates).group_by(&:date)
  end
end
