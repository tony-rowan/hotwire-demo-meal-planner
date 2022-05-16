class MealsController < ApplicationController
  before_action :set_meal, only: %i[edit update destroy]

  # GET /meals or /meals.json
  def index
    @meals = Meal.all
  end

  # GET /meals/new
  def new
    @meal = Meal.new
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals or /meals.json
  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      redirect_to meals_path, notice: "Meal was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meals/1 or /meals/1.json
  def update
    if @meal.update(meal_params)
      redirect_to meals_path, notice: "Meal was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /meals/1 or /meals/1.json
  def destroy
    @meal.destroy

    redirect_to meals_path, notice: "Meal was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_params
      params.require(:meal).permit(:meal, :date)
    end
end
