class CalendarDate
  include ActiveModel::Model

  attr_reader :date, :meal

  def initialize(date:, meal:)
    @date = date
    @meal = meal
  end

  def to_key
    [date]
  end
end
