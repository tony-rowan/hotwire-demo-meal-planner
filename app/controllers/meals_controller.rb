class MealsController < ApplicationController
  before_action :set_meal, only: %i[edit update destroy]

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def edit
  end

  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      redirect_to meals_path, notice: "Meal Planned!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @meal.update(meal_params)
      redirect_to meals_path, notice: "Meal Updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @meal.destroy
    redirect_to meals_path, notice: "Meal Removed!"
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:meal, :date)
  end
end
