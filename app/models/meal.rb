class Meal < ApplicationRecord
  validates :meal, presence: true
  validates :date, presence: true
end
