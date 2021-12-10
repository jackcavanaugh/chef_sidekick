class RecipesController < ApplicationController
  before_action :current_business_account_must_be_recipe_chef,
                only: %i[edit update destroy]

  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @q = current_business_account.recipes.ransack(params[:q])
    @recipes = @q.result(distinct: true).includes(:chef,
                                                  :recipe_ingredient_joins, :recipe_menu_joins, :orders).page(params[:page]).per(10)
  end

  def show
    @order = Order.new
    @recipe_menu_join = RecipeMenuJoin.new
    @recipe_ingredient_join = RecipeIngredientJoin.new
  end

  def new
    @recipe = Recipe.new
  end

  def edit; end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      message = "Recipe was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @recipe, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    message = "Recipe was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to recipes_url, notice: message
    end
  end

  private

  def current_business_account_must_be_recipe_chef
    set_recipe
    unless current_business_account == @recipe.chef
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:business_id, :recipe_name,
                                   :recipe_description)
  end
end
