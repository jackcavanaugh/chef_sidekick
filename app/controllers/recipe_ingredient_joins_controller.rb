class RecipeIngredientJoinsController < ApplicationController
  before_action :set_recipe_ingredient_join,
                only: %i[show edit update destroy]

  def index
    @q = RecipeIngredientJoin.ransack(params[:q])
    @recipe_ingredient_joins = @q.result(distinct: true).includes(:recipe,
                                                                  :ingredient).page(params[:page]).per(10)
  end

  def show; end

  def new
    @recipe_ingredient_join = RecipeIngredientJoin.new
  end

  def edit; end

  def create
    @recipe_ingredient_join = RecipeIngredientJoin.new(recipe_ingredient_join_params)

    if @recipe_ingredient_join.save
      message = "RecipeIngredientJoin was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @recipe_ingredient_join, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @recipe_ingredient_join.update(recipe_ingredient_join_params)
      redirect_to @recipe_ingredient_join,
                  notice: "Recipe ingredient join was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @recipe_ingredient_join.destroy
    message = "RecipeIngredientJoin was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to recipe_ingredient_joins_url, notice: message
    end
  end

  private

  def set_recipe_ingredient_join
    @recipe_ingredient_join = RecipeIngredientJoin.find(params[:id])
  end

  def recipe_ingredient_join_params
    params.require(:recipe_ingredient_join).permit(:recipe_id, :ingredient_id)
  end
end
