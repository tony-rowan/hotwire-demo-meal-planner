class MealsController < ApplicationController
  before_action :set_meal, only: %i[edit update destroy]

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new(date: params[:date])
  end

  def edit
  end

  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Meal Planned!" }
        format.turbo_stream { flash.now[:notice] = "Meal Planned!" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @meal.update(meal_params)
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Meal Updated!" }
        format.turbo_stream { flash.now[:notice] = "Meal Updated!" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Meal Removed!" }
      format.turbo_stream { flash.now[:notice] = "Meal Removed!" }
    end
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:meal, :date)
  end
end
