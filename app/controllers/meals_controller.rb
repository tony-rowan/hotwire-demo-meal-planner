class MealsController < ApplicationController
  before_action :set_meal, only: %i[edit update destroy]

  def new
    @meal = Meal.new(date: new_meal_date)
  end

  def edit
  end

  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @meal.update(meal_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @meal.destroy

    redirect_to root_path
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def new_meal_date
    params[:date] || Date.today
  end

  def meal_params
    params.require(:meal).permit(:meal, :date)
  end
end
